"use strict";

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

const generateReport = require(`./generate-report.js`);

const report = generateReport(data);

console.log("Number of rows: " + report.numRows);
console.log("Number of columns: " + report.numColumns);
console.log("Columns: " + report.columnNames.join(", "));
