// Cache-first service worker: once installed, the app never waits on the network.
// Bump VERSION whenever any file in SHELL changes.
const VERSION = "v2";
const SHELL_CACHE = `ww-shell-${VERSION}`;
const SHELL = [
  "./",
  "index.html",
  "app.js",
  "style.css",
  "manifest.webmanifest",
  "data/route.geojson",
  "data/wicklow-way-stages-1-4.gpx",
  "lib/leaflet.css",
  "lib/leaflet.js",
  "lib/pmtiles.js",
  "lib/protomaps-leaflet.js",
  "icons/icon-180.png",
  "icons/icon-192.png",
  "icons/icon-512.png",
];
// data/wicklow.pmtiles (23 MB) is stored separately by app.js in "ww-tiles-v1"
// with a progress bar, so a flaky connection can't break installing the shell.

self.addEventListener("install", (event) => {
  event.waitUntil(
    caches
      .open(SHELL_CACHE)
      .then((cache) => cache.addAll(SHELL.map((u) => new Request(u, { cache: "reload" }))))
      .then(() => self.skipWaiting())
  );
});

self.addEventListener("activate", (event) => {
  event.waitUntil(
    caches
      .keys()
      .then((keys) =>
        Promise.all(
          keys.filter((k) => k.startsWith("ww-shell-") && k !== SHELL_CACHE).map((k) => caches.delete(k))
        )
      )
      .then(() => self.clients.claim())
  );
});

self.addEventListener("fetch", (event) => {
  const req = event.request;
  if (req.method !== "GET" || new URL(req.url).origin !== self.location.origin) return;

  event.respondWith(
    (async () => {
      const cached = await caches.match(req, { ignoreSearch: true });
      if (cached) return cached;
      if (req.mode === "navigate") {
        const shell = await caches.match("index.html");
        if (shell) return shell;
      }
      try {
        return await fetch(req);
      } catch (e) {
        return new Response("Offline and not cached", { status: 503, statusText: "Offline" });
      }
    })()
  );
});
