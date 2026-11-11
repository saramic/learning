#!/usr/bin/env node
// Build public/data/route.geojson for Wicklow Way stages 1-4 from
// OpenStreetMap relation 2740 (data © OpenStreetMap contributors, ODbL).
//
//   node scripts/build-route.mjs            # uses .cache/relation-2740.json if present
//   node scripts/build-route.mjs --refresh  # re-download from Overpass

import { existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";

const RELATION_ID = 2740;
const CACHE = `.cache/relation-${RELATION_ID}.json`;
const OUT = "public/data/route.geojson";
const MIRRORS = [
  "https://overpass-api.de/api/interpreter",
  "https://maps.mail.ru/osm/tools/overpass/api/interpreter",
  "https://overpass.kumi.systems/api/interpreter",
];

// Stage boundaries: the route is split at the point nearest each place.
// Knockree and Roundwood are the trail-side stage ends (Roundwood village is
// ~2 km off the Way); the others are landmarks that snapping resolves.
const PLACES = [
  { name: "Marlay Park", lat: 53.2735, lng: -6.2706 },
  { name: "Knockree", lat: 53.172418, lng: -6.221159 },
  { name: "Roundwood", lat: 53.060021, lng: -6.255276 },
  { name: "Glendalough", lat: 53.0105, lng: -6.329 },
  { name: "Glenmalure", lat: 52.9561, lng: -6.3623 },
];
const STAGE_COLOURS = ["#d7263d", "#1b6ca8", "#f49d37", "#3f8a2a"];

async function download() {
  const query = `[out:json][timeout:100];relation(${RELATION_ID});out geom;`;
  for (const url of MIRRORS) {
    try {
      console.log(`Fetching relation ${RELATION_ID} from ${url}`);
      const res = await fetch(url, {
        method: "POST",
        headers: { "User-Agent": "saramic-learning-wicklow-pwa" },
        body: new URLSearchParams({ data: query }),
      });
      const text = await res.text();
      JSON.parse(text); // Overpass returns HTML/text errors when busy
      mkdirSync(".cache", { recursive: true });
      writeFileSync(CACHE, text);
      return;
    } catch (e) {
      console.warn(`  failed: ${e.message.slice(0, 80)}`);
    }
  }
  throw new Error("All Overpass mirrors failed; try again later");
}

const key = (p) => `${p.lat.toFixed(7)},${p.lon.toFixed(7)}`;

function haversineKm(a, b) {
  const R = 6371;
  const toRad = (d) => (d * Math.PI) / 180;
  const dLat = toRad(b[1] - a[1]);
  const dLng = toRad(b[0] - a[0]);
  const h =
    Math.sin(dLat / 2) ** 2 +
    Math.cos(toRad(a[1])) * Math.cos(toRad(b[1])) * Math.sin(dLng / 2) ** 2;
  return 2 * R * Math.asin(Math.sqrt(h));
}

// Chain the relation's ways (in member order) into one line, flipping each way
// so it continues from the current end. Reports any gaps it had to jump.
function stitch(ways) {
  let line = [...ways[0]];
  // orient the first way towards the second
  const second = ways[1];
  const touches = (p) => key(p) === key(second[0]) || key(p) === key(second.at(-1));
  if (touches(line[0]) && !touches(line.at(-1))) line.reverse();

  const gaps = [];
  for (const way of ways.slice(1)) {
    const end = line.at(-1);
    let next = way;
    if (key(way.at(-1)) === key(end)) next = [...way].reverse();
    else if (key(way[0]) !== key(end)) {
      // not connected: pick the orientation whose start is nearest
      const dStart = haversineKm([end.lon, end.lat], [way[0].lon, way[0].lat]);
      const dEnd = haversineKm([end.lon, end.lat], [way.at(-1).lon, way.at(-1).lat]);
      if (dEnd < dStart) next = [...way].reverse();
      gaps.push(Math.min(dStart, dEnd));
    }
    line.push(...next.slice(key(next[0]) === key(end) ? 1 : 0));
  }
  return { coords: line.map((p) => [p.lon, p.lat]), gaps };
}

function nearestIndex(coords, place) {
  let best = 0;
  let bestD = Infinity;
  coords.forEach((c, i) => {
    const d = haversineKm(c, [place.lng, place.lat]);
    if (d < bestD) [best, bestD] = [i, d];
  });
  return { index: best, distanceKm: bestD };
}

const round = (n, dp = 5) => Number(n.toFixed(dp));

if (process.argv.includes("--refresh") || !existsSync(CACHE)) await download();
const relation = JSON.parse(readFileSync(CACHE, "utf8")).elements[0];

const ways = relation.members
  .filter((m) => m.type === "way" && m.geometry?.length > 1)
  .map((m) => m.geometry);
let { coords, gaps } = stitch(ways);

// Run north → south: Marlay Park first
if (
  haversineKm(coords.at(-1), [PLACES[0].lng, PLACES[0].lat]) <
  haversineKm(coords[0], [PLACES[0].lng, PLACES[0].lat])
) {
  coords.reverse();
}

const bigGaps = gaps.filter((g) => g > 0.05);
console.log(
  `Stitched ${ways.length} ways → ${coords.length} points, ${bigGaps.length} gaps > 50 m` +
    (bigGaps.length ? ` (largest ${Math.max(...bigGaps).toFixed(2)} km)` : "")
);

const cuts = PLACES.map((place) => ({ place, ...nearestIndex(coords, place) }));
cuts.forEach(({ place, distanceKm }) =>
  console.log(`  ${place.name}: route passes ${distanceKm.toFixed(2)} km away`)
);
for (let i = 1; i < cuts.length; i++) {
  if (cuts[i].index <= cuts[i - 1].index) {
    throw new Error(`Stage boundary ${cuts[i].place.name} is out of order`);
  }
}

const features = [];
let startKm = 0;
for (let s = 0; s < cuts.length - 1; s++) {
  const line = coords.slice(cuts[s].index, cuts[s + 1].index + 1);
  let km = 0;
  for (let i = 1; i < line.length; i++) km += haversineKm(line[i - 1], line[i]);
  features.push({
    type: "Feature",
    properties: {
      kind: "stage",
      stage: s + 1,
      from: cuts[s].place.name,
      to: cuts[s + 1].place.name,
      km: round(km, 2),
      startKm: round(startKm, 2),
      colour: STAGE_COLOURS[s],
    },
    geometry: { type: "LineString", coordinates: line.map(([x, y]) => [round(x), round(y)]) },
  });
  console.log(`  Stage ${s + 1}: ${cuts[s].place.name} → ${cuts[s + 1].place.name} ${km.toFixed(1)} km`);
  startKm += km;
}

cuts.forEach(({ place, index }, i) =>
  features.push({
    type: "Feature",
    properties: { kind: "place", name: place.name, stageStart: i + 1 },
    geometry: { type: "Point", coordinates: coords[index].map((n) => round(n)) },
  })
);

relation.members
  .filter((m) => m.type === "node" && m.role === "guidepost")
  .forEach((m) =>
    features.push({
      type: "Feature",
      properties: { kind: "guidepost" },
      geometry: { type: "Point", coordinates: [round(m.lon), round(m.lat)] },
    })
  );

// Same stages as GPX tracks, for Garmin Earthmate / Organic Maps / OsmAnd
const gpx = [
  '<?xml version="1.0" encoding="UTF-8"?>',
  '<gpx version="1.1" creator="wicklow_way_pwa" xmlns="http://www.topografix.com/GPX/1/1">',
  "<metadata><name>Wicklow Way stages 1-4</name>",
  "<copyright author=\"OpenStreetMap contributors\"><license>https://opendatacommons.org/licenses/odbl/</license></copyright></metadata>",
  ...features
    .filter((f) => f.properties.kind === "place")
    .map(({ properties: p, geometry: { coordinates: [lon, lat] } }) =>
      `<wpt lat="${lat}" lon="${lon}"><name>${p.name}</name></wpt>`
    ),
  ...features
    .filter((f) => f.properties.kind === "stage")
    .map(({ properties: p, geometry }) =>
      [
        `<trk><name>Stage ${p.stage}: ${p.from} to ${p.to} (${p.km.toFixed(1)} km)</name><trkseg>`,
        ...geometry.coordinates.map(([lon, lat]) => `<trkpt lat="${lat}" lon="${lon}"/>`),
        "</trkseg></trk>",
      ].join("\n")
    ),
  "</gpx>",
].join("\n");

mkdirSync("public/data", { recursive: true });
writeFileSync("public/data/wicklow-way-stages-1-4.gpx", gpx);
writeFileSync(
  OUT,
  JSON.stringify({
    type: "FeatureCollection",
    attribution: "© OpenStreetMap contributors (ODbL), relation 2740",
    builtAt: new Date().toISOString(),
    features,
  })
);
console.log(`Wrote ${OUT}`);
