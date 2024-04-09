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

1. **Unit test**

