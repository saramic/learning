import { Observable } from "rxjs";

const observable$ = new Observable<string>(subscriber => {
  console.log("Observalbe exectued");
  subscriber.next("Alice");
  setTimeout(() => subscriber.next("Ben"), 200);
  setTimeout(() => subscriber.next("Charlie"), 400);
})

console.log("Subscription 1 starts");
observable$.subscribe(value => console.log("Subscription 1:", value));

setTimeout(() => {
  console.log("Subscription 2 starts");
  observable$.subscribe(value => console.log("Subscription 2:", value));
}, 100);

