import { Observable } from "rxjs";

const observable$ = new Observable<string>(subscriber => {
  console.log("Observalbe exectued");
  subscriber.next("Alice");
  setTimeout(() => subscriber.next("Ben"), 200);
  setTimeout(() => subscriber.next("Charlie"), 400);
})

const subscription = observable$.subscribe(value => console.log(value));
setTimeout(() => {
    console.log("Unsubscribe");
    subscription.unsubscribe();
}, 300);

// should kill the observable as well to capture last setTimeout
