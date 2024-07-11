import { Observable } from "rxjs";
import output from "./output";

// const observable$ = new Observable<[]<integer, integer>>(subscriber => {
const observable$ = new Observable<string>(subscriber => {
  let count = 0;
  output('Observable executed');
  const intervalId = setInterval(() => {
    // could use this to show that the clearInterval is needed
    // output(['Emitting', count]);
    count++;
    subscriber.next([count, Date.now()]);
  }, 1000);

  return () => {
    clearInterval(intervalId);
    // allow to teardown for cleanup or cancelation
    output("Teardown");
  };
})

output('subscribe to 1 second interval');
const subscription = observable$.subscribe({
  next: value => output(value),
  complete: () => output('Complete'),
  error: error => output(error),
});
setTimeout(() => {
  output('after 5 seconds unsubscribing');
  subscription.unsubscribe();
}, 5000);

