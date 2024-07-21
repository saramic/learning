import { fromEvent, map, Subject } from "rxjs";
import output from "./output";

output("App started");

const emitButton = document.querySelector("button#emit");
const inputElement = document.querySelector("input#value-input");
const subuscribeButton = document.querySelector("button#subscribe");

if (!emitButton || !inputElement || !subuscribeButton) {
  throw new Error("inputs not found");
}

const value$ = new Subject<string>();

// NOTE: similar to below
// fromEvent(emitButton, "click").subscribe(() =>
//   value$.next(inputElement["value"])
// );
// NOTE: similar to above
fromEvent(emitButton, "click")
  .pipe(map(() => inputElement["value"]))
  .subscribe(value$);

fromEvent(subuscribeButton, "click").subscribe(() => {
  output("New subscription");
  value$.subscribe((value) => output(value));
});
