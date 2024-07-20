import { catchError, concatMap, EMPTY, Observable, of } from "rxjs";
import output from "./output";

output("App started");

const source$ = new Observable(subscriber => {
  setTimeout(() => subscriber.next('A'), 1000);
  setTimeout(() => subscriber.next('B'), 2000);
  setTimeout(() => subscriber.next('C'), 3000);
  setTimeout(() => subscriber.next('D'), 4000);
  setTimeout(() => subscriber.next('E'), 5000);
  setTimeout(() => subscriber.complete(), 6000);
})

source$.pipe(
  concatMap(_value => of(1, 2))
).subscribe(value => output(value));

