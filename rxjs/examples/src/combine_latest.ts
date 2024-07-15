import { combineLatest, fromEvent } from "rxjs";
import output from "./output";

const temperatureInput = document.getElementById("temperature-input");
const conversionDropdown = document.getElementById("conversion-dropdown");
const resultText = document.getElementById("result-text");

if (!temperatureInput || !conversionDropdown || !resultText) {
  throw new Error("Button not found");
}

const temperature$ = fromEvent(temperatureInput, "input");
const conversion$ = fromEvent(conversionDropdown, "input");

combineLatest([temperature$, conversion$]).subscribe(
  ([temperatureInputEvent, conversionInputEvent]) => {
    if (
      !temperatureInputEvent.target ||
      !conversionInputEvent.target ||
      !temperatureInputEvent.target["value"] ||
      !conversionInputEvent.target["value"]
    ) {
      return;
    }
    const temperature = parseFloat(temperatureInputEvent.target["value"]);
    const conversion = conversionInputEvent.target["value"];
    output(temperature);
    output(conversion);
    let result: number;
    if (conversion === "c-to-f") {
      result = (temperature * 9) / 5 + 32;
    } else {
      result = ((temperature - 32) * 5) / 9;
    }
    resultText.value = result.toString();
  }
);
