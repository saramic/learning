# Learning

Goals and progress of my learning

## Goals - Feb 2017

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

## Goals - Jun 2017

### Mastery guild
  - [ ] running self development brownbags in streams at work to instill an
    always learning mentality at work
  - [ ] run a coding dojo series to get as many people up to speed to
    effectively and efficiently take part in TDD randori dojo

### New Language
  - [ ] elm
  - [ ] elixir
  - [ ] clojure

### Programming
  - [ ] POODR, Patterns & OO, Exceptions, refactoring
  - [ ] basics of FP

### Teach
  - [ ] run a workshop on new technology like: functional programming, speed,
    haproxy/nginx, serverless technology, react/redux, elm
  - [ ] plan a talk

### Build
  - [ ] ...

## Progress

* Mon 13th Feb 2017
  * read Ch 3 serverless
  * started notes on RubyConfAU 2017
* Sun 12th Feb 2017
  * (Performance Profiling Node Apps - Tom
    Gallacher)[https://www.youtube.com/watch?v=BtBh4VW5eDE]
    not really useful need to look elswehre on how to use these tools
    * flamegraph
    * Chrome CPU inspector
    * Chrome Tracing
    * dtruss/strace
    * `node --perf-basic-prof`
    * (IRHydra2)[http://mrale.ph/irhydra/2/] - see video
  * watched (HTTP2 CampJS 2016)[https://vimeo.com/171333277]
    * take a look at:
      * curl,
      * setup in nginx,
      * how to do a push?
      * can you make a chat client in telnet/curl (assuming no TLS)?,
      * speed improvement comparison for many assets (images),
      * take a look at QICK?
  * setup watching of test file

    cd dojo/es6/tennis
    yarn add -D gulp
    cat >> gulpfile.js
    ...^D
    gulp test
    gulp tdd

  * continue with dojo

* Sat 11th Feb 2017
  * started reading serverless architecture on AWS
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

