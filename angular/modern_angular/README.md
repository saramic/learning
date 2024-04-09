# README

## Generic project setup

1. **base project**

   assuming ng installed with

   ```bash
   # assuming asdf
   asdf plugin add nodejs
   asdf list-all nodejs | ag 20
   asdf local nodejs 20.12.1
   asdf install

   npm install --global @angular/cli
   ```

   ```bash
   ng new project-name \
	   --minimal \
	   --defaults \
	   --standalone \
	   --routing
   ```

1. **linting**

   Add `ESlint` for linting

   ```bash
   ng add @angular-eslint/schematics

   # show runnable scripts
   npm run

   # run lint
   npm run lint
   ```

1. **E2E test**

   install Cypress with

   ```bash
   ng add @cypress/schematic

   npm run

   # can now
   npm run e2e            # open cypress
   npm run cypress:open   # also open cypress
   npm run cypress:run    # run the default tests (fail)
   ```

   * alter `.gitignore` to ignore `cypress/screenshots/`

   * and fix the test, can also run with

   ```bash
   npm run e2e

   # or pre choose the runner, chrome in this case
   npm run e2e -- --browser chrome --e2e

   # or run the app and test
   npm start
   npm run cypress:run
   ```

1. **Unit test**

   if wanting to use the default **Karma** setup, you may not want to create a
   `--minimal` app as there is quite a bit of setup required

   ```bash
   # configure angular to run tests in angular.json
   "test": {
     "builder": "@angular-devkit/build-angular:karma",
     "options": {
       "polyfills": [
         "zone.js",
         "zone.js/testing"
       ],
       "tsConfig": "tsconfig.spec.json",
       "assets": [
         "src/favicon.ico",
         "src/assets"
       ],
       "styles": [
         "src/styles.css"
       ],
       "scripts": []
     }
   },

   # not sure if there is a helper script to do this like ng init?
   npm install --save-dev \
     @types/jasmine \
     jasmine-core \
     karma \
     karma-chrome-launcher \
     karma-coverage \
     karma-jasmine \
     karma-jasmine-html-reporter

   # add a bunch of package.json config
   "scripts": {
     ...
     "test": "ng test",

   # write a first spec like
   ./src/app/app.component.spec.ts

   # add spec ts config
   ./tsconfig.spec.json

   # run the tests, they run in the browser 🤮
   npm run
   npm test

   npm test -- --watch=false # for CI run
   # succeeds but prints out ERROR ? 🤪
   ```

1. **Unit test - vitest**

   following https://dev.to/brandontroberts/faster-testing-with-angular-and-vitest-274n

   ```bash
   npm install @analogjs/platform --save-dev
   ng generate @analogjs/platform:setup-vitest
   ```

   and due to Karma tests installed above

   ```bash
   npm uninstall \
     @types/jasmine \
     jasmine-core \
     karma \
     karma-chrome-launcher \
     karma-coverage \
     karma-jasmine \
     karma-jasmine-html-reporter
   ```

   ```bash
   npm test
   # but does not seem to read in changes??? 😭

   # running vitest does work
   npx vitest

   # to run once like for CI also does not work under ng test
   npx vitest --watch false
   ```

   seems to work with existing Karma tests - but faster!!!

   **Alternative**

   ```bash
   npm add --save-dev vitest

   # add a basic vitest config from somewhere?
   vitest.config.ts
   ```

   _note: did not work with existing tests due to errors, probably need more
   config_
