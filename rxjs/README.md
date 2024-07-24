## RxJS course

Udemy: **RxJS 7 and Observables: Introduction**

> Learn how Observables work and behave in an easy to understand
> step-by-step way!

- _Jurek Wozniak_
- https://www.udemy.com/course/rxjs-and-observables

## Challenge

Looking back at the course, the general concept of dealing with
background tasks, retries and error cases as well as down stream
events seemed like a way to sum up the full level of the course.
The idea here is, what challenge would address all these ideas,
either as a demonstration of them or as a challenge for a general
discussion on tasks, errors, and retries - similar to Sidekiq jobs
and microservices in Rails world.

Maybe something along the lines of:
- many events - 2 mice from 2 users or some API calls
- that could result in too many calls
- need to be processed on the fly
- maybe to find intersections and prevent going off screen (via
  error)

something like that?

## Resources

- https://rxjs.dev/guide/overview
- RxJS Marbles (https://rxmarbles.com/) for interaction diagrams
  of Rx Observables
- https://rxjs-dev.firebaseapp.com/guide/overview
- on GitHub - https://github.com/ReactiveX/rxjs

### blogs to read

- [ ] [
    To unsubscribe, or not to unsubscribe, that is the question. —
    Subscriptions in RxJS - Jurek Wozniak
    ](https://jaywoz.medium.com/rxjs-when-to-unsubscribe-c6f39b8b95b7)
- [ ] [
    Ground control to major Tom — HTTP calls in RxJS - Jurel Wozniak
    ](https://jaywoz.medium.com/ground-control-to-major-tom-http-calls-in-rxjs-1d47ba964b6c)
- [ ] [
    Information is King — tap() — how to console.log in RxJS -
    Jurek Wozniak
    ](https://jaywoz.medium.com/information-is-king-tap-how-to-console-log-in-rxjs-7fc09db0ad5a)

## setup local dev

1. create a new directory and setup `package.json`

   ```sh
   mkdir rxjs-learning
   cd rxjs-learning
   npm init --yes
   npm add rxjs
   npm add --save-dev vite typescript
   ```

1. make sure to manually add a `"scripts"` `"dev": "vite",` section inside
   `package.json` which should look like:

   ```sh
   cat package.json

   {
     "name": "rxjs-learning",
     "version": "1.0.0",
     "description": "",
     "main": "index.js",
     "scripts": {
       "dev": "vite",
       "test": "echo \"Error: no test specified\" && exit 1"
     },
     "keywords": [],
     "author": "",
     "license": "ISC"
   }
   ```

1. creae a basic index.html

   ```sh
   cat <<EOF > index.html
   <!DOCTYPE html>
   <html lang="en">
   <head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Exercises</title>
     <link
       rel="stylesheet"
       href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
     >
   </head>
   <body>
     <div class="container">
       <h2 class="my-4">Hello</h2>
     </div>
     <ul id="output">
     </ul>
     <script type="module" src="src/index.ts"></script>
   </body>
   </html>
   EOF
   ```

1. create a `src` directory

   ```sh
   mkdir src
   ```

1. create a basic auto output to page `src/output.ts`

   ```sh
   cat <<EOF > src/output.ts
   export default (string) => {
     const outputList = document.querySelector("#output");
     const liElem = document.createElement('li');
     const newContent = document.createTextNode(string);
     liElem.appendChild(newContent);
     outputList.appendChild(liElem);
   }
   EOF
   ```

1. finally create a demo app in `src/index.ts`

   ```sh
   cat <<EOF > src/index.ts
   import { interval, timer } from "rxjs";
   import output from "./output";

   output("App started");

   let subscription = interval(100).subscribe(
     (event) => output(event),
   );

   timer(1000).subscribe(() => {
     subscription.unsubscribe();
     output("Unsubscribe");
   })
   EOF
   ```

1. to run

   ```sh
   npm run dev
   ```
1. and check it out in the browser

   ```sh
   open http://localhost:5174
   ```
1. the app subscribes to an RxJS `timer` for 1 second getting events every
   100ms and finally unsubscribing after 10 events after 1 second.

## Work log

_reverse chronological view of commits_

### Hot vs Cold observables

- **Cold❄️ **
    - set of values
    - HTTP requests
    - timer/interval
- **Hot🔥**
    - DOM Events
    - state ng/rxjs
    - subjects

---

commit 0813a17c4cf3b06931e61f56b265711678cb232c

show mutliple subscriptions

each subscription is independent observable executor

---

commit 0c531f725c02b3c5ad80511950d2fbbeac47ff3a

show subscribe and unsubscribe

demo time when obsrvable returns over a span of time and the observalbe
is unsubscribed before last value is returned.

---

commit aa6bb597be8b189f17ce62716dee42c4a3910627

quick start as part of udemy course

udemy course:
    https://www.udemy.com/course/rxjs-and-observables
recomends stackblitz setup or this code setup
    https://github.com/JerryDoubleU/rxjs-playground
but here the vite setup seems much simpler
```
    npm init --yes
    # change to "type": "module",
    npm add rxjs
    npm add --save-dev vite typescript
    # add some script options to run vite
```
run demo and watch the console
