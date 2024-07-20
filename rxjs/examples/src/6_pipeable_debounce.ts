import { debounceTime, fromEvent, map } from "rxjs";
import output from "./output";

const sliderInput = document.querySelector("#slider") as HTMLInputElement;

if (!sliderInput) {
  throw new Error("slider not found");
}

output("App started");

fromEvent(sliderInput, "input")
  .pipe(
    debounceTime(200),
    map((event) => event.target["value"] as number)
  )
  .subscribe((value) => output(value));
