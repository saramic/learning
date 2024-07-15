import { fromEvent, Observable } from "rxjs";
import output from "./output";

const triggerButton = document.querySelector("button#trigger");
if (!triggerButton) {
  throw new Error("Button not found");
}

// const subscription = fromEvent<MouseEvent>(triggerButton, 'click').subscribe(
//   event => output([event.type, event.x, event.y])
// )

const triggerClick$ = new Observable<MouseEvent>((subscriber) => {
  const clickHandlerFn = (event) => {
    // here to make sure the event listner has been removed
    output("Event callback executed");
    subscriber.next(event);
  };

  triggerButton?.addEventListener("click", clickHandlerFn);

  return () => {
    // required to clean up the event listener
    triggerButton.removeEventListener("click", clickHandlerFn);
  };
});

const subscription = triggerClick$.subscribe((event) =>
  output([event.type, event.x, event.y])
);

setTimeout(() => {
  output("Unsubscribing");
  subscription.unsubscribe();
}, 5000);
