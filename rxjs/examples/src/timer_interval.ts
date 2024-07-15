import { interval, Observable, timer } from "rxjs";
import output from "./output";

output("App started");

const timer$ = new Observable<number>((subscriber) => {
  const timeoutId = setTimeout(() => {
    // show when timeout happens
    output("Timeout!");
    subscriber.next(0);
    subscriber.complete();
  }, 2000);
  // teardown for the timeoutId when unsubscribed
  return() => clearTimeout(timeoutId);
});
const subscription = timer$.subscribe({
  next: (event) => output(event),
  complete: () => output("Complete"),
});

// NOTE: equivalent to the above
// const subscription = timer(2000).subscribe({
//   next: (value) => output(value),
//   complete: () => output("Complete"),
// });
setTimeout(() => {
  subscription.unsubscribe();
  // will unsbcribe after 1 second before completes after 2 seconds
  output("Unsubscribed timer");
}, 1000);

output("Interval started");
const subscripitionInterval = interval(1000).subscribe({
  next: value => output(value),
  complete: () => output("Complete"),
})

setTimeout(() => {
  subscripitionInterval.unsubscribe();
  output("Unsubscribed interval");
}, 5000)
