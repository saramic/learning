import { BehaviorSubject, fromEvent, withLatestFrom } from "rxjs";
import output from "./output";

output("App started");

const loggedInSpan = document.querySelector("span#logged-in");
const loginButton = document.querySelector("button#login");
const logoutButton = document.querySelector("button#logout");
const printStateButton = document.querySelector("button#print-state");

if (!loggedInSpan || !loginButton || !logoutButton || !printStateButton) {
  throw new Error("inputs not found");
}

// NOTE: initailly plain subject
// const isLoggedIn$ = new Subject<boolean>();
// NOTE: now with memory a behaviourSubject - initial state false
const isLoggedIn$ = new BehaviorSubject<boolean>(false);

fromEvent(loginButton, "click").subscribe(() => isLoggedIn$.next(true));
fromEvent(logoutButton, "click").subscribe(() => isLoggedIn$.next(false));

// NOTE: assuming navigation bar is separate - Navigation Bar
isLoggedIn$.subscribe(
  (isLoggedIn) => (loggedInSpan["innerText"] = isLoggedIn.toString())
);

// NOTE: seperate from above for demostration - Buttons
isLoggedIn$.subscribe((isLoggedIn) => {
  logoutButton["style"].display = isLoggedIn ? "block" : "none";
  loginButton["style"].display = !isLoggedIn ? "block" : "none";
});

// NOTE: this works
// fromEvent(printStateButton, "click").subscribe(() =>
//   output(`User is logged in: ${isLoggedIn$.value}`)
// );
// NOTE: this is more reactive
fromEvent(printStateButton, "click")
  .pipe(withLatestFrom(isLoggedIn$))
  .subscribe(([event, isLoggedIn]) =>
    output(
      `User is logged in: ${isLoggedIn} with event: ${JSON.stringify(event)}`
    )
  );
