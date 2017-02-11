# Learning

Goals and progress of my learning

## Feb 2017

### Mastery Guild
  - [ ] Read articles on guilds/societies
  - [ ] write up notes from RubyConf2017
  - [ ] release notes from RubyConf2017
  - [ ] plan learning meeting
    - [ ] introduce at townhall/slack/email/confluence
    - [ ] run learning meetings - optional/cross stream/work on fromat
  - [ ] learning meeting future
    - [ ] run in scalablility
    - [ ] TDD upskill
    - workshops:
      - functional prgramming and languages
      - speed
      - haproxy and server composition

### New Languages
  - [ ] elixir - continue on reading basic guide
  - [ ] clojure - basic guide? books? dojo?
  - [ ] elm - basic guide from web
  - [ ] re-read react book 

### Programming
  - [ ] daily dojo in ES6
    - [ ] learn the new concepts http://es6-features.org/
    - [ ] learn the jest concepts
      http://facebook.github.io/jest/docs/getting-started.html
  - [ ] regular react front ends of all the ideas

### Teach
  - [ ] prepare functional Programming workshop

## Progress

* Sat 11th Feb 2017
  * setup es6 dojo

    cd dojo/es6
    mkdir tennis
    cd tennis
    yarn init
    # TODO confirm if these are all necessary?
    yarn add -D jest
    yarn add -D babel-jest
    yarn add -D babel-cli
    yarn add -D babel-preset-latest

    cat >> .babelrc
    {"presets": ["latest"]}

    # add to packages.json
    "scripts": { "test": "jest" }

  * setup es6 tennis dojo

    cd dojo/es6/tennis
    yarn
    yarn test

