import {
  catchError,
  concatMap,
  EMPTY,
  fromEvent,
  map,
  of,
} from "rxjs";
import { ajax } from "rxjs/ajax";
import output from "./output";

output("App started");

const endpointInput: HTMLInputElement | null =
  document.querySelector("input#endpoint");
const fetchButton = document.querySelector("button#fetch");

if (!fetchButton || !endpointInput) {
  throw new Error("inputs not found");
}

fromEvent(fetchButton, "click")
  .pipe(
    map(() => endpointInput.value),
    concatMap((value) =>
      ajax(`https://random-data-api.com/api/${value}/random_${value}`).pipe(
        // allows for outside subscrption to keep working
        // catchError(() => EMPTY)
        catchError((error) => of(`Cound not fetch data: ${error}`))
      )
    )
    // NOTE: this would end our subscription if the ajax failed
    // catchError(() => EMPTY)
  )
  .subscribe({
    next: (value) => output(["Response:", JSON.stringify(value)]),
    error: (err) => output(["Error:", err]),
    complete: () => output("Complete"),
  });
