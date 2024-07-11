import { Observable } from "rxjs";

const output = (string) => {
  const outputList = document.querySelector("#output");
  const liElem = document.createElement('li');
  const newContent = document.createTextNode(string);
  liElem.appendChild(newContent);
  outputList.appendChild(liElem);
}

const observable$ = new Observable<string>(subscriber => {
  output('Observable executed');
  subscriber.next('Alice');
  subscriber.next('Ben');
  setTimeout(() => {
    subscriber.next('Charlie');
    // remove complete to deal with error 4s after
    // subscriber.complete();
  }, 2000);
  setTimeout(() => 
    subscriber.error(new Error("error")),
    4000
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
output('2 seconds later an asynchronous output of Charlie');
// output('... followed by the complete hook');
output('4 seconds later the error');
output('... and then the Teardown hook');

