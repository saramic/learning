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

   npm install -g @angular/cli
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

