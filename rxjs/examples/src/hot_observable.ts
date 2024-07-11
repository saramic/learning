import { Observable } from "rxjs";
import output from "./output";

const helloButton = document.querySelector('button#hello')

const helloClick$ = new Observable(subscriber => {
  helloButton.addEventListener('click', (event) => {
    subscriber.next(event)
  })
  // TODO: need to add a tear down logic to remove the listiner as we
  //       unsubscribe
});

helloClick$.subscribe({
  next: event => output(["Sub 1:", event.type, event.x, event.y]),
  error: error => output(["Sub 1 error:", error])
});
setTimeout(() => {
  output("Subscription 2 start")
  helloClick$.subscribe({
    next: event => output(["Sub 2:", event.type, event.x, event.y]),
    error: error => output(["Sub 2 error:", error])
  });
}, 5000);
