import { Observable } from "rxjs";
import output from "./output";

const observable$ = new Observable<string>(subscriber => {
  output('Observable executed');
  subscriber.next('Alice');
  subscriber.next('Ben');
  setTimeout(() => {
    subscriber.next('Charlie');
    // remove complete to deal with error 4s after
    // subscriber.complete();
  }, 4000);
  setTimeout(() => 
    subscriber.error(new Error("error")),
    2000
  );

  return () => {
    // allow to teardown for cleanup or cancelation
    output("Teardown");
  };
})

output('Before subscribe');
output('Immedaite synchronous output of Alice and Ben');
observable$.subscribe({
  next: value => output(value),
  complete: () => output('Complete'),
  error: error => output(error),
});
output('After subscribe');
output('2 seconds later the error');
output('... and then the Teardown hook');
output("4 seconds later NOTHING more, we don't get Charlie");
// output('... followed by the complete hook');

