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
  setTimeout(() => subscriber.next('Charlie'), 2000);
})

output('Before subscribe');
output('Immedaite synchronous output of Alice and Ben');
observable$.subscribe(value => output(value));
output('After subscribe');
output('2 seconds later an asynchronous output of Charlie');

