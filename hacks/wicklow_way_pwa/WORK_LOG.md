# Work log — Wicklow Way offline PWA

## 2026-11-12 — Why: wicklowtrails.ie let me down on the trail

Walked Wicklow Way stages 1 and 2 using <https://wicklowtrails.ie> (an
installable PWA, "Wicklow VAM", built by Waywyser) with little or no signal.
Stage 3 is tomorrow.

### What I experienced

- The app keeps losing where I am and restarts.
- Repeatedly got
  `FetchEvent.respondWith ... ReferenceError: Can't find variable: matchPrecache`
  and waited a long time.
- Can't zoom in past a certain level (bad eyesight — I want to zoom as far as I
  like and keep that view when I return).
- Every reopen with no signal meant: search for the segment → choose it → zoom
  the page → dismiss registration → find myself → zoom again.
- Good: maps work offline, GPS dot shows on the map, the route line is drawn.
- Bad: each stage is its own island; can't pan past the edge of a stage.

### Analysis of the live app (fetched HTML, manifest, service worker, bundle)

Stack: Vue 3 app, Leaflet 1.7.1 from unpkg, jQuery/Bootstrap from CDNs,
Workbox 6.5.4 service worker (`/service-worker.js`), Dexie/IndexedDB for data.

| Symptom | Root cause |
|---|---|
| `ReferenceError: matchPrecache` | The SW's `setCatchHandler` does `"navigate"===e.request.mode ? await matchPrecache("/index.html") : Response.error()`. In a bundled Workbox build `matchPrecache` is a module export, not a global, so the offline fallback itself throws. There is also **no `precacheAndRoute`** at all, so even if fixed nothing is precached to serve. Pages use a network-first default handler (`pages-cache`) → with bad signal you wait for the network to fail, then hit the crash. |
| App restarts / loses place | iOS/Android kill backgrounded PWAs; on reload the map always starts at a hard-coded `setView([52.91,-6.22],15)` then `fitBounds(polyline)`. Map centre, zoom, chosen stage and follow mode are **never persisted** (only list filters are in `localStorage`). |
| Zoom limit | Offline tiles are `/mapTiles/mapTiles.zip` (2.7 MB, 714 JPGs, from Dec 2024) extracted into IndexedDB. Zoom levels present: 1–13 only (z13: 500 tiles, z12: 143 …). Leaflet layer is `maxZoom:16, maxNativeZoom:13` → beyond z13 it just upscales blurry ~19 m/px images, then stops at 16. |
| Stages are islands | Each "card" page loads only its own `Polyline` from IndexedDB and draws it; there is no combined view. |
| Registration prompt every time | Install/registration popups run on app open; dismissal is not reliably remembered. |
| Fragile offline libraries | Leaflet/jQuery/Bootstrap come from third-party CDNs as no-cors scripts; offline they depend on the browser HTTP cache. |

Side finding (worth reporting to the operator): the public JS bundle and SW
contain a hard-coded HTTP Basic-Auth credential for
`live-api-v2.waywyser.com`. Not used here.

### Immediate workaround for stage 3

Use an offline map app with a downloaded region + GPX:
Organic Maps / OsmAnd (free), or Garmin Earthmate **after** downloading a map
area while on wifi. Keep wicklowtrails.ie as backup.

### Plan for this project

1. Route data from OpenStreetMap (ODbL): relation **2740 "Wicklow Way"**
   (operator: Irish National Waymarked Trails), stitched into one line and split
   into stages 1–4 at Knockree / Roundwood / Glendalough / Glenmalure.
2. Offline basemap: a Protomaps `.pmtiles` vector extract of the stage 1–4 area
   rendered with Leaflet + protomaps-leaflet — vector, so it stays sharp at
   any zoom.
3. App shell precached by a hand-written service worker, cache-first, zero
   network calls on startup. All libraries vendored locally.
4. One continuous map, stages 1–4 coloured, jump buttons per stage.
5. GPS dot + accuracy, snap to route → km done / km to stage end.
6. **Persist everything** (centre, zoom, follow mode, last fix, breadcrumb)
   to `localStorage` on every move/fix and restore it first on launch.
7. Big buttons, high-contrast, thick route line.

## Steps

### 1. Route data from OpenStreetMap

- Overpass: `relation["name"~"Wicklow Way"]` gives **relation 2740**
  (`network=nwn`, operator Irish National Waymarked Trails, 129 km).
- `overpass-api.de` returned "502 at capacity", so the script falls back
  through mirrors. `maps.mail.ru` worked.
- `relation(2740);out geom;` gives 335 ways, 5 guidepost nodes and 1 other
  node.
- `scripts/build-route.mjs` stitches the ways in member order, flipping each
  one to join the previous end. Result: **5,686 points, 0 gaps over 50 m**.
  The line is oriented to run north → south from Marlay Park.
- First split using town coordinates: stage 1 came out at 16.5 km against
  about 20–22 km published, because "Knockree" snapped too early.
  Roundwood village is 2 km off the trail.
- Cross-checked the end points against third-party stage GPX files from
  walkwicklow.pages.dev. Those files are noisy (stage 1 measures 36 km), but
  their stage 1 and stage 2 end points sit exactly on the OSM line, at km
  19.2 and km 38.7.
- Using those as the Knockree and Roundwood boundaries gives stages of
  **19.2 / 19.5 / 11.2 / 14.0 km**, 63.9 km in total, which matches the
  published 20 / 18–21 / 12–13 / 14.
- Output: `public/data/route.geojson` (73 KB): 4 stage lines with
  `startKm`, `km` and colour, plus 5 stage-end points and the guideposts.

### 2. Offline basemap

- Raster tiles were ruled out. OSM's tile policy forbids bulk downloads, and
  raster tiles go blurry when overzoomed, which is the same problem the
  original app has.
- Used the Protomaps vector basemap (OSM data, schema v4.15). The `pmtiles`
  CLI v1.31.2 (go-pmtiles) is downloaded into `.cache/bin` by
  `scripts/build-tiles.sh`.
- `pmtiles extract https://build.protomaps.com/20261110.pmtiles
  --bbox=-6.50,52.90,-6.08,53.32 --maxzoom=15` gives **23 MB, 3,409 tiles**,
  done in 13 s.
- Renderer: protomaps-leaflet 5.1.0. Its `PmtilesSource` accepts either a
  URL string or a `PMTiles` instance. Passing
  `new pmtiles.PMTiles(new pmtiles.FileSource(new File([blob])))` (pmtiles
  3.2.1, the version protomaps-leaflet depends on) means the whole file comes
  from Cache Storage. No HTTP range requests are made, so nothing is
  awkward to serve offline from a service worker.
- Labels are drawn with canvas system fonts, so no glyph or sprite files are
  needed.

### 3. App

- `public/index.html`, `style.css` and `app.js` are plain JS with no build
  step. Leaflet, pmtiles and protomaps-leaflet are vendored in
  `public/lib/`, so nothing loads from a CDN.
- Startup order in `app.js`:
  1. Read `localStorage["ww-state-v1"]`.
  2. `L.map(...).setView(saved centre, saved zoom)`. This is synchronous,
     before any `await`.
  3. Then load the route and basemap, and start GPS.
- State is saved on every `moveend`/`zoomend`, every GPS fix,
  `visibilitychange` (when hidden) and `pagehide`.
- Follow mode only pans and never changes zoom. Dragging the map turns
  follow off. When following, + and − zoom around the user's position.
- Snapping: each fix is projected onto every route segment in a local flat
  km frame (about 5,700 segments, which is cheap). That gives km along the
  route, which gives the stage, km done and km left. A fix more than 60 m
  from the route shows a warning.
- Breadcrumb: a point is added only when GPS accuracy is 50 m or better and
  you have moved more than 10 m. It is capped at 20,000 points.
- Optional Screen Wake Lock (feature-detected), re-acquired on
  `visibilitychange`.
- `public/sw.js`: precaches the shell (cache-first, `cache: "reload"` on
  install), the navigation fallback is the cached `index.html`, and old
  `ww-shell-*` caches are deleted. The 23 MB map is *not* in the install
  step, so a flaky connection can't fail installation. The app downloads it
  with a progress bar into `ww-tiles-v1` and calls
  `navigator.storage.persist()`.
- Icons are drawn by `scripts/make-icons.py`, a pure-Python PNG writer with
  no dependencies.

### 4. Testing (`npm run smoke`, Playwright 1.56.1)

The first run failed two checks:
- Zoom only reached 12: clicking + while a zoom animation is running is
  ignored, so the test now waits 400 ms between clicks, as a person would.
- The GPS test point was 568 m off route, so it was changed to a point taken
  from the stage 3 geometry.

Fixed after looking at the screenshots:
- The attribution appeared twice (protomaps-leaflet adds its own).
- In follow mode, zooming went around the screen centre and lost the dot.
- "Whole route" put stage 1 under the top panel; fitted views now use
  `paddingTopLeft: [20, 140]`.

WebKit: `context.setOffline(true)` gave "WebKit encountered an internal
error" even though the SW was controlling the page and both caches existed.
Playwright's WebKit offline emulation blocks requests before the SW sees
them. The test now simulates no signal by **killing the web server**, which
is more realistic anyway.

Final result, **Chromium and WebKit both all green**:

```
✅ offline map downloaded and stored
✅ GPS fix shows stage progress — Stage 3: 4.7 km done · 6.5 km to Glendalough
✅ zoom goes beyond 18 — zoom 19
✅ reload restores same view — zoom 19, centre 53.03522,-6.287141
✅ offline reload: app + map still load
✅ no page errors
```

### 5. Hosting

The phone needs HTTPS for GPS and the service worker. This repo already
serves `docs/` on GitHub Pages (<https://saramic.github.io/learning/>).
`scripts/deploy-docs.sh` copies `public/` to `docs/wicklow/`. After a commit
and push the app is at <https://saramic.github.io/learning/wicklow/>.
Everything uses relative paths, so it works under that subpath.

### 6. GPX export

`build-route.mjs` also writes `public/data/wicklow-way-stages-1-4.gpx`
(4 `<trk>`, 3,564 points, 5 stage-end `<wpt>`). It is precached and linked
from the menu, so it can be loaded into Earthmate, Organic Maps or OsmAnd as
a backup.

### Notes for stage 3 tomorrow

- Garmin Earthmate can do the job, but only after a map area is downloaded
  on wifi. Import `wicklow-way-stages-1-4.gpx` as well to see the line.
- Keep this PWA and wicklowtrails.ie as cross-checks.

### 7. Deploying to GitHub Pages

- Confirmed Pages builds from `docs/` on master: the June 2026 post in
  `docs/_posts` is live under `https://saramic.github.io/learning/`.
- Gotcha: `docs/.gitignore` has a `vendor` rule (for Jekyll's bundler), so
  `docs/wicklow/vendor/*.js` was silently left out of `git add`. The deployed
  app would have loaded without Leaflet. Renamed `public/vendor/` →
  `public/lib/` and bumped the SW `VERSION` to `v2`.
- The 23 MB `wicklow.pmtiles` appears in both `public/data/` and
  `docs/wicklow/data/`, but git stores identical content once (same blob
  hash `5e80a41…`), so it costs 23 MB once.
- Linked from the repo root `README.md` under "Hacks".
