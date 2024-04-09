# README

## Generic project setup

1. **base project**

   assuming ng installed with

   ```bash
   asdf local nodejs lts
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

1. **Unit test**

