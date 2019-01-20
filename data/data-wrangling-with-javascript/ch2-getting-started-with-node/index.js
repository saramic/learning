"use strict";

const express = require("express");
const path = require("path");
const generateReport = require("./generate-report");

const app = express();

const staticFilesPath = path.join(__dirname, "public");
const staticFilesMiddleWare = express.static(staticFilesPath);
app.use("/", staticFilesMiddleWare);

const data = [
  {
    dive_divers: "",
    dive_end_lat: "",
    dive_end_lng: ""
  },
  {
    dive_divers: "",
    dive_end_lat: "",
    dive_end_lng: ""
  },
  {
    dive_divers: "",
    dive_end_lat: "",
    dive_end_lng: ""
  }
];

app.get("/rest/data", (req, res) => {
  const report = generateReport(data);
  res.json(report);
});

app.listen(3000, () => {
  console.log("Web server listening on port 3000!");
});
