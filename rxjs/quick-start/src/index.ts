import { Observable } from "rxjs";

const name$ = new Observable<string>(subscriber => {
  subscriber.next('Alice');
  subscriber.next('Ben');
  subscriber.next('Charlie');
  subscriber.complete();
})

const observer = {
  next: (value) => console.log(value),
};
name$.subscribe(observer);

// alternate inline observer defaults to next:
name$.subscribe((value) => console.log(value));
