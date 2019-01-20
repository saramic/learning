# Progress Jan 2019

* Sun 20th
- BOOK data wrangling with javascript ch 1 - 2.6

- BOOK test driven react ch 1 - 3 
  - setup
  ```
  mkdir test-driven-fizzbuzz
  cd test-driven-fizzbuzz

  # say yes to all questions
  npm init -y
  npm install --save-dev jest@23.6.0

  # the -- is to pass arguments not to npm but what npm is running in this case jest
  npm run test -- --watch
  ```
  - VS code
  ```
  ⌘ p # to open command palette
  > Preverences: Keymaps # although it picked up I have VIM installed so turns on those bindings by default

  > Shell Command: install code command in PATH # a good thing

  ^` # CTRL-` to toggle terminal

  code -r . # to reuse existing window
  # in terminal
  npm run test -- --watchAll
  ```
    - git settings seem limited
      - no log?
      - no way to add new dir to existing git repo?
      - no way to add node modules to .gitignore?
      - ended doing that from the terminal as it is easier!
  ```
  ⌘ b # to hide/unhide navigation side bar

  # in settings ignore certain files from sidebar
    "files.exclude": {
      "node_modules": true,
      "package-lock.json": true
    }

  ⌘ K ⌘ S # display shortcuts
  ⌘ K ⌘ F # to auto format a selection

  ⌘ SHIFT X # show extentions side bar

  ⌥ SHIFT F # to auto format
  ```
  - followed along to end ch 3 and added tests that test state. Next will be
    styled components and snapshot tests.

* Sat 19th
  - clean up of this repo
  - theremin touchbar https://gist.github.com/danburzo/f54e912b7fbefb0df00d9d0306e40a8b

  Old README
  Short list
    - learn [rust](lang/rust/rust_in_action)
      - following [Rust in action](https://www.manning.com/books/rust-in-action)
        - [ ] ch4 "lifetimes, ownership and borrowning"
    - finish API workshop idea from rails camp
      - [ ] push to github
      - [ ] MVP: file definition of problems, hints, parsing as both browser and cURL
      - [ ] REST CRUD example
      - [ ] CORS demonstration
      - [ ] signed cookies demonstration
      - [ ] auth scheme demonstration
      - [ ] HATEOAS demo
      - [ ] starting to move to GraphQL
    - unicorn log parser to find long running processes
      - [ ] new project with unicorn setup to generate logs
      - [ ] parse logs
    - create a blog using jekyll
      - [ ] put it on github and sort out hosting
      - [ ] "pioneering style lashed lettering"
    - kids coding
      - [x] setup github https://github.com/tamadillo
      - [x] start blog https://github.com/tamadillo/learning
      - [x] some python coding https://github.com/tamadillo/learning/tree/master/python
      - [ ] more blog
      - [ ] more python turtle
      - arduino advent calendar
      - wearable electronics and knitting
      - coding laptop

