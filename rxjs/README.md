## RxJS course

Udemy: **RxJS 7 and Observables: Introduction**

> Learn how Observables work and behave in an easy to understand
> step-by-step way!

- _Jurek Wozniak_
- https://www.udemy.com/course/rxjs-and-observables

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
