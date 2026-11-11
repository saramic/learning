#!/usr/bin/env node
// End-to-end check of the things that went wrong with wicklowtrails.ie:
//   1. offline map downloads and renders, zoom goes past 18
//   2. GPS fix → progress along the right stage
//   3. reload restores exactly the same view (centre + zoom + follow)
//   4. with the server gone, a reload still works (no SW crash)
//
//   npm run smoke            # chromium
//   BROWSER=webkit npm run smoke
import { spawn } from "node:child_process";
import { mkdirSync, readFileSync } from "node:fs";
import * as pw from "playwright";

const PORT = 8123;
const URL = `http://localhost:${PORT}/`;
const SHOTS = "tmp/screenshots";
mkdirSync(SHOTS, { recursive: true });

const server = spawn("python3", ["-m", "http.server", String(PORT), "--directory", "public"], {
  stdio: "ignore",
});
await new Promise((r) => setTimeout(r, 800));

// a point a third of the way along stage 3 (Roundwood → Glendalough)
const stage3 = JSON.parse(readFileSync("public/data/route.geojson", "utf8")).features.find(
  (f) => f.properties.stage === 3
).geometry.coordinates;
const [lng, lat] = stage3[Math.floor(stage3.length / 3)];
const FIX = { latitude: lat, longitude: lng, accuracy: 8 };

let failures = 0;
function check(name, ok, detail = "") {
  console.log(`${ok ? "✅" : "❌"} ${name}${detail ? " — " + detail : ""}`);
  if (!ok) failures++;
}

const browserType = pw[process.env.BROWSER || "chromium"];
const browser = await browserType.launch();
const context = await browser.newContext({
  viewport: { width: 390, height: 844 },
  deviceScaleFactor: 2,
  geolocation: FIX,
  permissions: ["geolocation"],
});
const page = await context.newPage();
const errors = [];
page.on("pageerror", (e) => errors.push(e.message));
page.on("console", (m) => m.type() === "error" && errors.push(m.text()));

try {
  await page.goto(URL);
  await page.waitForFunction(() => document.getElementById("download").hidden, null, { timeout: 60000 });
  check("offline map downloaded and stored", true);
  await page.waitForFunction(() => navigator.serviceWorker.controller !== null, null, { timeout: 15000 }).catch(() => {});
  if (!(await page.evaluate(() => navigator.serviceWorker.controller !== null))) {
    await page.reload(); // first load isn't controlled until the SW claims it
  }

  const progress = await page
    .waitForFunction(() => /Stage \d/.test(document.getElementById("progress").textContent), null, {
      timeout: 15000,
    })
    .then(() => page.textContent("#progress"));
  check("GPS fix shows stage progress", /^Stage 3/.test(progress) && !/off route/.test(progress), progress);

  // follow on, zoom in far
  await page.click("#follow");
  for (let i = 0; i < 8; i++) {
    await page.click("#zoom-in");
    await page.waitForTimeout(400); // let each zoom animation finish, like a person would
  }
  await page.waitForTimeout(1500);
  const before = await page.evaluate(() => JSON.parse(localStorage.getItem("ww-state-v1")));
  check("zoom goes beyond 18", before.zoom > 18, `zoom ${before.zoom}`);
  await page.screenshot({ path: `${SHOTS}/1-zoomed-in.png` });

  await page.reload();
  await page.waitForTimeout(1500);
  const after = await page.evaluate(() => JSON.parse(localStorage.getItem("ww-state-v1")));
  check(
    "reload restores same view",
    after.zoom === before.zoom &&
      Math.abs(after.center[0] - before.center[0]) < 1e-5 &&
      Math.abs(after.center[1] - before.center[1]) < 1e-5 &&
      after.follow === true,
    `zoom ${after.zoom}, centre ${after.center}`
  );

  // "no signal": stop the web server entirely (Playwright's setOffline in
  // WebKit blocks requests before the service worker sees them)
  server.kill();
  await new Promise((r) => setTimeout(r, 300));
  await page.reload();
  await page.waitForTimeout(2500);
  const offlineOk = await page.evaluate(
    () => document.getElementById("download").hidden && !!document.querySelector(".leaflet-tile-loaded, canvas")
  );
  check("offline reload: app + map still load", offlineOk);
  await page.screenshot({ path: `${SHOTS}/2-offline-reload.png` });

  // zoom out to see the whole thing offline
  await page.evaluate(() => document.querySelector("#menu-btn").click());
  await page.click("text=Whole route");
  await page.waitForTimeout(2000);
  await page.screenshot({ path: `${SHOTS}/3-offline-whole-route.png` });

  check("no page errors", errors.length === 0, errors.slice(0, 3).join(" | "));
} catch (e) {
  check("smoke test ran", false, e.message);
} finally {
  await browser.close();
  server.kill();
}
console.log(`screenshots in ${SHOTS}/`);
process.exit(failures ? 1 : 0);
