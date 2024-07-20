import { catchError, EMPTY, Observable } from "rxjs";
import output from "./output";

output("App started");

const failingHttpRequest$ = new Observable((subscriber) => {
  setTimeout(() => {
    subscriber.error(new Error("Tiemout"));
  }, 1000);
});

failingHttpRequest$
  // .pipe(catchError((_error) => of("Fallback value")))
  .pipe(catchError((_error) => EMPTY))
  .subscribe({
    next: (value) => output(value),
    complete: () => output("Complete")
  });
