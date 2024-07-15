import { from, Observable, of, Subscriber } from "rxjs";
import output from "./output";

// OF
of("Alice", "Ben", "Charlie").subscribe({
  next: (value) => output(value),
  complete: () => output("Complete"),
});

// NOTE: same as of above
const names$ = new Observable<string>((subscriber) => {
  subscriber.next("Alice - basic observable");
  subscriber.next("Ben - basic observable");
  subscriber.next("Charlie - basic observable");
  subscriber.complete();
});

names$.subscribe({
  next: (value) => output(value),
  complete: () => output("Complete"),
});

// NOTE: same as of above
function ourOwnOf(...args: string[]): Observable<string> {
  return new Observable<string>((subscriber) => {
    args.map((value) => subscriber.next(value));
    subscriber.complete();
  });
}

ourOwnOf("Alice - ourOwnOf", "Ben - ourOwnOf", "Charlie - ourOwnOf").subscribe({
  next: (value) => output(value),
  complete: () => output("Complete"),
});

// FROM
from(["Alice - from", "Ben - from", "Charlie - from"]).subscribe({
  next: (value) => output(value),
  complete: () => output("Complete"),
});

const somePromise = new Promise((resolve, reject) => {
  // NOTE: need to resolve or reject the promise through comments
  resolve('Resolved!')
  // reject("Rejected!");
});

const observableFromPromise$ = from(somePromise);
observableFromPromise$.subscribe({
  next: (value) => output(value),
  error: (err) => output(err),
  complete: () => output("Complete"),
});
