# IONIC

following course

[
    Udemy: Build Native iOS & Android as well as Progressive Web
    Apps with Angular, Capacitor and the Ionic Framework (Ionic
    4+).
](https://www.udemy.com/course/ionic-2-the-practical-guide-to-building-ios-android-apps)


## Section 1 - Getting Started

commit 5bd58ba8caa1ed4dbdca9e433074c1515e8c96cf

start new project

following:
  https://www.udemy.com/course/ionic-2-the-practical-guide-to-building-ios-android-apps
using:
```
    asdf local nodejs 21.6.1
    npm install -g ionic
    ionic start
    cd ionic-angular-course
    ionic serve
```

could have run:
```
    ionic start --help
    ionic start --list
    ionic start myApp blank
    ionic start myApp tabs --capacitor
    ionic start myApp super --type=ionic-angular
    ionic start "Conference App" \
        https://github.com/ionic-team/ionic-conference-app
```

---

commit 80aafc0a68200d82322db536622cc8548c591082

Added a clickable button

there are a bunch of components in:
    https://ionicframework.com/docs/components

## Section 2 - Angular Refresher

commit 5fc85008cf5884187a8b529d869697ba7f1707fe

ng new for angular refresher

with:
```
    npm install -g @angular/cli
    ng new ng-refresher
    cd ng-refresher
    ng serve
    ng build
```

---

commit 80db091574e9971a25ecff887f6aebdf4e03e4cb

add a component

with:
```
    ng generate component persons
```
Also deleted the generic cruft from app.component.html

---

commit 7d2fc19989a48d877e0c84796067ff03e6ddaebe

pass data down to component via Input

from `@angular/core`. Note als that to use the `*ngFor` directive in the
html, we needed to import `NgFor` from `@angular/common` in the component.

---

commit f180ffe59f2ad1d9dd0117d624ab923ca02653f6

add some input

created a new component:
```
    ng generate component person-input
```

and referenced the component via a HTML element reverence via:
```
    #personNameElem
```

---

commit cc9c3e2d06a925026a4459f5c2a48d2404d8b1b4

switch to using model

need to import
```
    import { FormsModule } from '@angular/forms';
```

---

commit ea709f6a47357326c8f05496842065fa437268f4

use `EventEmitter` and binding of `$event`

to pass value from persons-input via the app to the persons component.

the input capturing is done by round brackets? and we use a special
variable `$event`
```
    <... (event_name)="function($event)">
```

we have 2 way binding

---

commit d259461bc0e795e72e70c1d1233b297757c5d8c4

create persons service

with:
```
    ng generate service persons/persons
```

using an NG lifecycle hook is prefereable over adding in constrcutor
```
    // https://angular.dev/guide/components/lifecycle
    ngOnInit() {
      this.personList = this.personService.persons
    }
```

note also added some routing here

---

commit cf8e5e00756ca9a9d919a17b25f387af68a2ca71

add routing and remove person

but does not refresh the persons array automatically, only if
re-rendered by a route change

Also remove Emitter in favour of sharing via model in service

---

commit a810b6a696ad8d4566d011d3253538caa56a6cec

use rxjs observables to share updates

similar to emitter used earlier, also note it is best practice to
OnDestroy un-subscribe

---

commit 55631043e3bcc23e2736d5b10f77008e0731c592

make http requests using NG HttpClient

as it needs to be a standalone component, cannot use `HttpClient` but
need to use the `providedHttpClient` which is attached as a provider in
the root of the app `src/app/app.config.ts`

the http get uses a `pipe` and a `map` from `rxjs/operators` to process
the input

but now the app is some what broken as the API is called anytime the
component is loaded which means the add and delete functionality no
longer works.

---

commit 53355d6f663f7eeebde637c34407b949bfdaab4c

add a simple fetching state with ngIf

### Play

commit 4e6ecc2d91454229b48c0da4bfee510b1966d8cb

start of a seven segment display

with:
```
    ng new ng-seven-segment \
        --defaults \
        --standalone \
        --routing
    ng serve
    ng generate component display
    ng generate component seven-segment
```

and some svg from:
    https://commons.wikimedia.org/wiki/File:7-segment_abcdefg.svg

---

commit 7edb3d0806d0ddb18607f577adcff90b395817a3

naive numbers in seven segment

---

commit c471ad28ead35f82c00c27ddb7a9873ec46c0e86

seven segment looping MR ROBOT

## Section 3 - Ionic Component Basics

commit 736035e1943e326c07ce339d7437984f7df16676

demo ionic only app

There where a couple of changes in API
    - as mentioned in the video the change to using custom classes that
      are pre-pended with 'ion-...'
    - also the ion-alert-controller was no longer a thing but instead
      the ion-alert was manually generated with some JS
Ionic was loaded from the CDN
    - https://ionicframework.com/docs/intro/cdn
documentation for the components can be found
    - https://ionicframework.com/docs/api/button
or the source code which is compiled using stencil but could help debug
the inner workings of things
    https://github.com/ionic-team/ionic-framework/blob/main/core/src/components/button/button.tsx
coverd some basics of: grids, buttons, applying styles etc.

### Assignment 1

commit 470ef68b85e780eb15872659576d99245c83db67

assignment 1 - ionic only components

similar to previous example, a demo app to store course names and their
ratings

## Section 4 - Angular + Ionic

commit 0ed780c2e7618cd16468bf4c0be53e244a0a48cb

switch home to recipies

could have probably used:
    ionic start ionic-angular-course blank --type=angular
created a "page" component using
    ionic generate page recipies
using
    <router-outlet></router-outlet>
to prove that it's an angular app but will switch to ion-router-outlet
for correct rendering next commit

---

commit d4c3ff124e6647b5871de1e3574d512ded92a238

switch to using ion-router-outlet

---

commit 1a959d788d7463c425151ba6aa492e4e8b5fbe9b

rename reci🥧🐕 to recipes

used:
  ionic generate page recipes

---

commit 250f0f6f7b327b8ddd54b8d9afd5497810a2fc47

add model and sub page

model added manually and sub page added with:
    ionic generate page recipes/recipe-detail

Also added some hard coded items to display in recipes.

---

commit 41f96c1015136a68c36caa26bc33a0d659fbc6be

switch routes

from
    http://localhost:8100/recipes/recipe-detail
to
    http://localhost:8100/recipes/id1
    http://localhost:8100/recipes/id2

---

commit 8485650e2842617d2fb7df7c2cb7b71817481042

RecipeService and display a recipe

with:
```
    ionic generate service recipes/recipes
```

also note that to deal with the "string | null" or no constructor added
a tsconfig property
```
    "strictPropertyInitialization": false,
```

also had a bunch of issues with typescript NOT being able to identify
that a value was truthy so used the ! to prompt it. Also used
    `as Recipe`
to deal with typescript thinking it may have undefined values.

---

commit 3189d7d43a4e023585ccdbe07d3fd3337b8331f9

add angular based router links

`ion-back-button` has `defaultHref` in case you land there and there is no
history
`routerLink` to visit a page

---

commit dbf1904b625d1704b90e82434c9f4f786b75e848

delete a recipe

- added ability to deleteRecipe
- also using AlertController for a modal delete/cancel
- using this.router.navigate(['/recipes']); to navigate

there are a couple of issues
- if starting on /recipies going to a recipie and deleting will not
  work, but will work if you start on a recipe and delete, one will be
  deleted - later on will cover how to make this work
- an invalid ID does not redirect at this stage, just no id

---

commit c538554e47b7f182e610e6fb7ee98415f8b73ff1

extract recipe-item component

generate with:
```
    ionic generate component recipes/recipe-item
```
at this stage highlghts this is just an angular app using things like

```
    @Input() recipeItem: Recipe
```

    and

```
    <app-recipe-item
        *ngFor="let recipe of recipes"
        [recipeItem]="recipe">
```

to link component variables

## Section 5 - Building Native Apps with Capacitor

commit 9589dd744598496f68f8452786e67eae1bd0827a (HEAD -> master)

setup android and ios app environment

using:
    # installed some android studio tools

    ng build # needed to build your project
    ionic capacitor add android
    ionic capacitor copy android
    ionic capacitor run android
    # didn't seem to connect to reload server
    ionic capacitor run android --livereload

    # install Xcode via App Store
    ionic capacitor add ios
    ionic capacitor copy ios
    ionic capacitor run ios -l # livereload

resources
- https://ionicframework.com/docs/developing/ios
- https://ionicframework.com/docs/developing/android
- https://capacitorjs.com/

## Section 6 - Debugging

- `console.log`
- Chrome dev tools debugging via source maps published under
  weback
- https://code.visualstudio.com/docs/nodejs/angular-tutorial#_debugging-angular
- chrome network tab
- chrome snapshot execution
- chrome memory in browser
- in native app
    - **Android**

      ```sh
      ionic capacitor run android --livereload
      ```
      - `console.log` statements visible in
- `chrome://inspect` - for native app
    - **IOS**
      ```sh
      ionic capacitor run ios --livereload
      ```
      - safari browser - web inspector for the simulator
- more on Chrome dev tools
    - https://developer.chrome.com/docs/devtools/
- more on Safari web insepctor
    - https://developer.apple.com/library/archive/documentation/NetworkingInternetWeb/Conceptual/Web_Inspector_Tutorial/Introduction/Introduction.html#//apple_ref/doc/uid/TP40017576-CH1-SW1

## Section 7 - Navigation & Routing in Ionic Apps

...

## Section 8 - Ionic Component Overview

## Section 9 - Styling & Theming Ionic Apps

## Section 10 - Handling User Input

## Section 11 - Managing State

## Section 12 - Sending Http Requests

## Section 13 - Adding Google Maps

## Section 14 - Using Native Device Features

_Camera & ..._

## Section 15 - Adding Authentication

## Section 16 - Publishing the Apps

## Section 17 - Roundup

## Section 18 - Bonus Content

