/* Wicklow Way stages 1-4 — offline map that never forgets where you were.
 *
 * Rule #1: restore the saved view synchronously, before anything async, so a
 * reload (the phone killed the app) lands exactly where you left off.
 */
(function () {
  "use strict";

  const STATE_KEY = "ww-state-v1";
  const TILES_CACHE = "ww-tiles-v1";
  const TILES_URL = "data/wicklow.pmtiles";
  const ROUTE_URL = "data/route.geojson";
  const BOUNDS = L.latLngBounds([52.9, -6.5], [53.32, -6.08]);
  const MAX_BREADCRUMB = 20000;
  const OFF_ROUTE_M = 60;
  // keep fitted routes clear of the top panel and the right-hand buttons
  const FIT_PADDING = { paddingTopLeft: [20, 140], paddingBottomRight: [90, 20] };

  // ---------- persisted state ----------
  const defaults = {
    center: null, // [lat, lng]
    zoom: null,
    follow: false,
    lastFix: null, // {lat, lng, acc, t}
    breadcrumb: [], // [[lat, lng], ...]
    wake: false,
    bigText: false,
  };
  const state = Object.assign({}, defaults, readState());

  function readState() {
    try {
      return JSON.parse(localStorage.getItem(STATE_KEY)) || {};
    } catch (e) {
      return {};
    }
  }

  function saveState() {
    try {
      localStorage.setItem(STATE_KEY, JSON.stringify(state));
    } catch (e) {
      setStatus("Could not save position: " + e.message);
    }
  }

  // ---------- map, restored immediately ----------
  const map = L.map("map", {
    zoomControl: false,
    minZoom: 9,
    maxZoom: 21,
    maxBounds: BOUNDS.pad(0.5),
    zoomSnap: 0.5,
    zoomDelta: 1,
    wheelPxPerZoomLevel: 120,
    tap: false,
  });
  if (state.center && state.zoom != null) {
    map.setView(state.center, state.zoom, { animate: false });
  } else {
    map.fitBounds([[52.95, -6.39], [53.28, -6.2]]);
  }
  map.attributionControl.setPrefix(false); // the basemap layer adds OSM + Protomaps credit

  map.on("moveend zoomend", () => {
    const c = map.getCenter();
    state.center = [round(c.lat, 6), round(c.lng, 6)];
    state.zoom = map.getZoom();
    saveState();
  });
  // a finger on the map means "I'm looking around" — stop following
  map.on("dragstart", () => setFollow(false));

  // panes keep the route above the basemap and the GPS dot above the route
  map.createPane("route").style.zIndex = 410;
  map.createPane("trail").style.zIndex = 420;
  map.createPane("me").style.zIndex = 430;

  // ---------- UI helpers ----------
  const $ = (id) => document.getElementById(id);
  const statusEl = $("status");
  const progressEl = $("progress");
  function setStatus(msg) {
    statusEl.textContent = msg;
  }
  function round(n, dp) {
    const f = Math.pow(10, dp);
    return Math.round(n * f) / f;
  }

  document.body.classList.toggle("big-text", state.bigText);
  $("big-text").checked = state.bigText;
  $("big-text").addEventListener("change", (e) => {
    state.bigText = e.target.checked;
    document.body.classList.toggle("big-text", state.bigText);
    saveState();
  });

  // when following, zoom around me rather than around the middle of the screen
  function zoomBy(delta) {
    const z = Math.max(map.getMinZoom(), Math.min(map.getMaxZoom(), map.getZoom() + delta));
    if (state.follow && state.lastFix) map.setView([state.lastFix.lat, state.lastFix.lng], z);
    else map.setZoom(z);
  }
  $("zoom-in").addEventListener("click", () => zoomBy(1));
  $("zoom-out").addEventListener("click", () => zoomBy(-1));
  $("menu-btn").addEventListener("click", () => toggleMenu());
  function toggleMenu(open) {
    const menu = $("menu");
    const show = open == null ? menu.hidden : open;
    menu.hidden = !show;
    $("menu-btn").setAttribute("aria-expanded", String(show));
  }
  map.on("click", () => toggleMenu(false));

  // ---------- basemap (offline vector tiles) ----------
  async function loadBasemap() {
    let blob = null;
    try {
      const cache = await caches.open(TILES_CACHE);
      const hit = await cache.match(TILES_URL);
      if (hit) blob = await hit.blob();
    } catch (e) {
      console.warn("cache read failed", e);
    }
    if (blob) return showBasemap(blob);

    $("download").hidden = false;
    $("download-btn").onclick = downloadBasemap;
    if (navigator.onLine) downloadBasemap();
  }

  async function downloadBasemap() {
    const btn = $("download-btn");
    const bar = $("download-bar");
    const text = $("download-text");
    btn.disabled = true;
    bar.hidden = false;
    text.textContent = "Downloading offline map…";
    try {
      const res = await fetch(TILES_URL, { cache: "no-store" });
      if (!res.ok) throw new Error("HTTP " + res.status);
      const total = Number(res.headers.get("Content-Length")) || 0;
      const reader = res.body.getReader();
      const chunks = [];
      let got = 0;
      for (;;) {
        const { done, value } = await reader.read();
        if (done) break;
        chunks.push(value);
        got += value.length;
        if (total) bar.value = got / total;
        text.textContent = `Downloading offline map… ${(got / 1e6).toFixed(1)} MB`;
      }
      const blob = new Blob(chunks, { type: "application/octet-stream" });
      const cache = await caches.open(TILES_CACHE);
      await cache.put(TILES_URL, new Response(blob));
      if (navigator.storage && navigator.storage.persist) navigator.storage.persist();
      $("download").hidden = true;
      showBasemap(blob);
      setStatus("✅ Offline map saved on this device");
    } catch (e) {
      text.textContent = "Download failed (" + e.message + "). Try again on wifi.";
      btn.disabled = false;
    }
  }

  function showBasemap(blob) {
    const file = new File([blob], "wicklow.pmtiles");
    const source = new pmtiles.PMTiles(new pmtiles.FileSource(file));
    protomapsL
      .leafletLayer({
        url: source,
        flavor: "light",
        lang: "en",
        maxDataZoom: 15,
        maxZoom: 21,
        bounds: BOUNDS,
      })
      .addTo(map);
  }

  // ---------- route ----------
  let routeCoords = []; // [[lat, lng], ...] all stages joined
  let routeCum = []; // km from Marlay Park at each point
  let stages = [];

  async function loadRoute() {
    const geo = await (await fetch(ROUTE_URL)).json();
    stages = geo.features.filter((f) => f.properties.kind === "stage");
    const places = geo.features.filter((f) => f.properties.kind === "place");

    stages.forEach((f, i) => {
      const latlngs = f.geometry.coordinates.map(([lng, lat]) => [lat, lng]);
      L.polyline(latlngs, { pane: "route", color: "#fff", weight: 14, opacity: 0.9, interactive: false }).addTo(map);
      L.polyline(latlngs, { pane: "route", color: f.properties.colour, weight: 8, interactive: false }).addTo(map);
      (i === 0 ? latlngs : latlngs.slice(1)).forEach((p) => routeCoords.push(p));
    });
    routeCum = [0];
    for (let i = 1; i < routeCoords.length; i++) {
      routeCum.push(routeCum[i - 1] + distKm(routeCoords[i - 1], routeCoords[i]));
    }

    places.forEach((f) => {
      const [lng, lat] = f.geometry.coordinates;
      L.circleMarker([lat, lng], {
        pane: "route",
        radius: 10,
        color: "#111",
        weight: 3,
        fillColor: "#fff",
        fillOpacity: 1,
      })
        .bindTooltip(f.properties.name, { permanent: true, direction: "right", className: "place-label" })
        .addTo(map);
    });

    const buttons = $("stage-buttons");
    stages.forEach((f) => {
      const p = f.properties;
      const b = document.createElement("button");
      b.type = "button";
      b.style.borderLeftColor = p.colour;
      b.textContent = `Stage ${p.stage}: ${p.from} → ${p.to} (${p.km.toFixed(1)} km)`;
      b.onclick = () => {
        setFollow(false);
        map.fitBounds(L.geoJSON(f).getBounds(), FIT_PADDING);
        toggleMenu(false);
      };
      buttons.appendChild(b);
    });
    const all = document.createElement("button");
    all.type = "button";
    all.textContent = "Whole route (stages 1–4)";
    all.onclick = () => {
      setFollow(false);
      map.fitBounds(L.latLngBounds(routeCoords), FIT_PADDING);
      toggleMenu(false);
    };
    buttons.appendChild(all);
    $("about").textContent = `Route: ${geo.attribution}, built ${geo.builtAt.slice(0, 10)}.`;

    if (state.lastFix) updateProgress(state.lastFix);
  }

  function distKm(a, b) {
    const R = 6371;
    const toRad = Math.PI / 180;
    const dLat = (b[0] - a[0]) * toRad;
    const dLng = (b[1] - a[1]) * toRad;
    const h =
      Math.sin(dLat / 2) ** 2 + Math.cos(a[0] * toRad) * Math.cos(b[0] * toRad) * Math.sin(dLng / 2) ** 2;
    return 2 * R * Math.asin(Math.sqrt(h));
  }

  // Nearest point on the route (projected onto segments, in a local flat frame).
  function snap(lat, lng) {
    const kx = Math.cos((lat * Math.PI) / 180) * 111.32;
    const ky = 110.57;
    let best = { d2: Infinity, km: 0 };
    for (let i = 1; i < routeCoords.length; i++) {
      const ax = (routeCoords[i - 1][1] - lng) * kx;
      const ay = (routeCoords[i - 1][0] - lat) * ky;
      const bx = (routeCoords[i][1] - lng) * kx;
      const by = (routeCoords[i][0] - lat) * ky;
      const dx = bx - ax;
      const dy = by - ay;
      const len2 = dx * dx + dy * dy;
      let t = len2 ? -(ax * dx + ay * dy) / len2 : 0;
      t = Math.max(0, Math.min(1, t));
      const px = ax + t * dx;
      const py = ay + t * dy;
      const d2 = px * px + py * py;
      if (d2 < best.d2) {
        best = { d2, km: routeCum[i - 1] + t * (routeCum[i] - routeCum[i - 1]) };
      }
    }
    return { km: best.km, offKm: Math.sqrt(best.d2) };
  }

  function updateProgress(fix) {
    if (!routeCoords.length) return;
    const { km, offKm } = snap(fix.lat, fix.lng);
    const stage =
      stages.find((s) => km <= s.properties.startKm + s.properties.km + 1e-6) || stages[stages.length - 1];
    const p = stage.properties;
    const done = km - p.startKm;
    const left = p.startKm + p.km - km;
    let msg = `Stage ${p.stage}: ${done.toFixed(1)} km done · ${left.toFixed(1)} km to ${p.to}`;
    if (offKm * 1000 > OFF_ROUTE_M) msg += ` · ⚠️ ${Math.round(offKm * 1000)} m off route`;
    progressEl.textContent = msg;
  }

  // ---------- GPS ----------
  const accuracyCircle = L.circle([0, 0], {
    pane: "me",
    radius: 1,
    color: "#1565c0",
    weight: 1,
    fillOpacity: 0.12,
    interactive: false,
  });
  const meDot = L.circleMarker([0, 0], {
    pane: "me",
    radius: 11,
    color: "#fff",
    weight: 4,
    fillColor: "#1565c0",
    fillOpacity: 1,
    interactive: false,
  });
  const trailLine = L.polyline(state.breadcrumb, {
    pane: "trail",
    color: "#6a1b9a",
    weight: 5,
    dashArray: "2 8",
    lineCap: "round",
    interactive: false,
  }).addTo(map);

  function showFix(fix, stale) {
    const ll = [fix.lat, fix.lng];
    accuracyCircle.setLatLng(ll).setRadius(fix.acc || 1).addTo(map);
    meDot.setLatLng(ll).addTo(map);
    meDot.setStyle({ fillColor: stale ? "#888" : "#1565c0" });
  }

  function onPosition(pos) {
    const fix = {
      lat: pos.coords.latitude,
      lng: pos.coords.longitude,
      acc: Math.round(pos.coords.accuracy),
      t: pos.timestamp,
    };
    state.lastFix = fix;
    showFix(fix, false);

    // breadcrumb: only add points that are reasonably accurate and have moved
    const last = state.breadcrumb[state.breadcrumb.length - 1];
    if (fix.acc <= 50 && (!last || distKm(last, [fix.lat, fix.lng]) > 0.01)) {
      state.breadcrumb.push([round(fix.lat, 6), round(fix.lng, 6)]);
      if (state.breadcrumb.length > MAX_BREADCRUMB) state.breadcrumb.shift();
      trailLine.addLatLng([fix.lat, fix.lng]);
    }

    if (state.follow) map.panTo([fix.lat, fix.lng], { animate: false });
    updateProgress(fix);
    setStatus(`GPS ±${fix.acc} m · ${new Date(fix.t).toLocaleTimeString()}`);
    saveState();
  }

  function onPositionError(err) {
    setStatus("GPS: " + err.message + (state.lastFix ? " (showing last known position)" : ""));
  }

  function startGps() {
    if (!("geolocation" in navigator)) return setStatus("This browser has no GPS access.");
    navigator.geolocation.watchPosition(onPosition, onPositionError, {
      enableHighAccuracy: true,
      maximumAge: 5000,
    });
  }

  function setFollow(on) {
    state.follow = on;
    $("follow").setAttribute("aria-pressed", String(on));
    if (on && state.lastFix) map.panTo([state.lastFix.lat, state.lastFix.lng]);
    saveState();
  }
  // zoom stays wherever you put it — following only pans
  $("follow").addEventListener("click", () => setFollow(!state.follow));
  setFollow(state.follow);

  $("clear-trail").addEventListener("click", () => {
    if (!confirm("Clear the purple trail of where you have walked?")) return;
    state.breadcrumb = [];
    trailLine.setLatLngs([]);
    saveState();
  });

  // ---------- keep screen on (optional) ----------
  let wakeLock = null;
  async function applyWake() {
    if (!("wakeLock" in navigator)) {
      $("wake").disabled = true;
      $("wake").parentElement.title = "Not supported on this device";
      return;
    }
    try {
      if (state.wake && !wakeLock && document.visibilityState === "visible") {
        wakeLock = await navigator.wakeLock.request("screen");
        wakeLock.addEventListener("release", () => (wakeLock = null));
      } else if (!state.wake && wakeLock) {
        await wakeLock.release();
      }
    } catch (e) {
      console.warn("wake lock", e);
    }
  }
  $("wake").checked = state.wake;
  $("wake").addEventListener("change", (e) => {
    state.wake = e.target.checked;
    saveState();
    applyWake();
  });
  document.addEventListener("visibilitychange", () => {
    if (document.visibilityState === "visible") applyWake();
    else saveState();
  });
  window.addEventListener("pagehide", saveState);

  // ---------- boot ----------
  if (state.lastFix) showFix(state.lastFix, true);
  loadRoute().catch((e) => setStatus("Route failed to load: " + e.message));
  loadBasemap();
  startGps();
  applyWake();

  if ("serviceWorker" in navigator) {
    navigator.serviceWorker.register("sw.js").catch((e) => console.warn("SW", e));
  }
})();
