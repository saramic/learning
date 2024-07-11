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
    subscriber.complete();
  }, 2000);

  return () => {
    // allow to teardown for cleanup or cancelation
    output("Teardown");
  };
})

output('Before subscribe');
output('Immedaite synchronous output of Alice and Ben');
observable$.subscribe({
  next: value => output(value),
  complete: () => output("Complete"),
});
output('After subscribe');
output('2 seconds later an asynchronous output of Charlie');
output('... followed by the complete hook');
output('... and then the Teardown hook');

