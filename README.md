# Learning

Goals and progress of my learning

## Easy list of TODOs

  - [ ] Elm basics - https://guide.elm-lang.org/
  - [ ] Elixir
    - [ ] Elixir basics - http://elixir-lang.org/getting-started/introduction.html
    - [ ] Études for Elixir - http://chimera.labs.oreilly.com/books/1234000001642/index.html
      and code https://github.com/oreillymedia/etudes-for-elixir
  - [ ] clojure
  - [ ] watch videos
    - [ ] TCP and lower bound of web performance - https://www.youtube.com/watch?v=C8orjQLacTo
    - [ ] yesterdays perf HTTP2 anti panterns - https://www.youtube.com/watch?v=yURLTwZ3ehk
    - [ ] linux performance tools - https://www.youtube.com/watch?v=FJW8nGV4jxY
    - [ ] TCP connection walktrhough - https://www.youtube.com/watch?v=F27PLin3TV0
    - [ ] sharfest inside TCP handshake - https://www.youtube.com/watch?v=HGcbhCVZ8MU
    - [ ] buffer bloat - https://www.youtube.com/watch?v=qbIozKVz73g
    - [ ] full stack web performance - https://www.infoq.com/presentations/web-app-performance
    - [ ] Bottleneck analysis - https://www.youtube.com/watch?v=fGy9FAW1gj4
    - [ ] profiling and tuning a web application - https://www.youtube.com/watch?v=YKHLQ5OMtfw
    - [ ] Google chrome developer tools: profiling and optimizing - https://www.youtube.com/watch?v=OxW1dCjOstE
    - [ ] 4 best performanc tools for java - https://www.youtube.com/watch?v=wS5MOB2RCNg
    - [ ] deep inside node.js - https://www.infoq.com/interviews/node-ryan-dahl
    - [ ] keynote: 8 lines of code - https://www.infoq.com/presentations/8-lines-code-refactoring
    - [ ] hunting performance issues in Node js - https://www.youtube.com/watch?v=CqkJNF-8BJE
    - [ ] V8, modern JS & beyond - https://www.youtube.com/watch?v=N1swY14jiKc
    - [ ] predicting JJJ's top 100 PyCon - https://www.youtube.com/watch?v=qjTc5q7MsMg&index=12&list=PLs4CJRBY5F1IU2xckJUEj5ILWd4cta3vo
    - [ ] Unicode PyCon like RubyConf - https://www.youtube.com/watch?v=HVqbL8Sl4YM
  - [ ] dojo - http://codingdojo.org/kata/ or similar

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

* Wed 15th Feb 2017
  * went to elixir meetup
  * Envato's stools were cool
    Paimio by Artek $350 via http://www.anibou.com.au/
  * Elixir camp Apr 21-24 Mittagong NSW http://elixir.camp/
  * Talk: Monoids in elixir
    * allow for concurrent split and join as order is not important
    * reminds me of talk "Parallel Programming, Fork Join
      - [ ] https://www.youtube.com/watch?v=eRq5UBx6cbA
      - [ ] book "Clojure for the brave and true
      - [ ] braveclojure.com
    * protocols used by Enum and [] square bracket opperator
    * `defprotocol` and `defimpl`
    * monoid shouldn't know about data types
    * example of joining 2 carts with various types
    * could be extended to merge recursively
    * felt that there were a few issues about min/max time and typing that felt
      forced
    * @madlep admitted that this all makes more sense in haskel
    * haskel does type and function inference based on arguments and return
      type.
    - [ ] checkout his dot files https://github.com/madlep/dotfiles
      - NERD tree
      - tabs
      - column/row highlight
    - [ ] propose talk "Patterns from ruby to elixir - how I will learn elixir in a month"
      - https://github.com/elixir-melbourne/meetup
* Tue 14th Feb 2017
  * elixir enumerables and streams
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

