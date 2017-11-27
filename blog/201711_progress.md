# Progress November 2017

# Mon 27th
  * Setup github with my daughter https://github.com/tamadillo

# Fri 24th
  * **Bash** - run command many times
    ```
    for i in {1..10}; do rspec spec/my_spec.rb; done
    ```
  * **Mac OSX** - insert UTF8 charcter
    ```
    <ctrl>-<cmd>-<space>
    ```

# Tue 21st
  **idea buncrupcy**
    in progress in browser tabs
      * Hackable clothing
        - ada fruit make clothing http://www.makeuseof.com/tag/flora-arduino-project-kit-review-giveaway/
      * Ruby performance
        - rails GC and high performance http://engineering.appfolio.com/appfolio-engineering/2017/5/12/has-ruby-helped-rails-performance-other-than-garbage-collection
        - rails 2.3 release notes https://www.ruby-lang.org/en/news/2015/12/25/ruby-2-3-0-released/
          https://docs.ruby-lang.org/en/2.3.0/NEWS.html
        - debugging thread dumps -try with simple program http://www.mikeperham.com/2012/06/02/debugging-with-thread-dumps/
        - more thread dumps http://itreallymatters.net/post/29549982905/generating-thread-dumps-for-ruby-scripts#.Wg5leROCwUE
        - debugging ruby before kill -9 https://blog.newrelic.com/2013/04/29/debugging-stuck-ruby-processes-what-to-do-before-you-kill-9/
        - debugging ruby threads http://www.justskins.com/forums/debugging-threads-107169.html
        - https://stackoverflow.com/questions/19569170/good-tutorial-on-using-ruby-debug-to-switch-threads-in-a-ruby-program
        - ruby timeout https://endofline.wordpress.com/2010/12/31/ruby-standard-library-timeout/
        - ruby time outs dangerous https://coderwall.com/p/1novga/ruby-timeouts-are-dangerous
        - ho does ruby timeout work https://flushentitypacket.github.io/ruby/2015/02/21/ruby-timeout-how-does-it-even-work.html
        - https://stackoverflow.com/questions/9781104/execution-expired-exception-crashing-ruby-thread-but-timeouterror-is-handled
        - resillianec in ruby https://johnnunemaker.com/resilience-in-ruby/
        - ruby concurrency explained http://merbist.com/2011/02/22/concurrency-in-ruby-explained/
        - concurrency and  parallelism primer https://www.toptal.com/ruby/ruby-concurrency-and-parallelism-a-practical-primer
        - [ ] ruby intor part II - https://engineering.universe.com/introduction-to-concurrency-models-with-ruby-part-ii-c39c7e612bed
        - reactor pattern https://en.wikipedia.org/wiki/Reactor_pattern
      * Caching api calls for starva
        - cachebar https://github.com/vigetlabs/cachebar
        - strava api 3 https://github.com/jaredholdcroft/strava-api-v3
        - http://exploringrpi.com/chapter2/
      * API guides
        - rest api guide http://www.andrewhavens.com/posts/20/beginners-guide-to-creating-a-rest-api/
        - api with sinatra https://www.engineyard.com/blog/doing-an-api-mashup-with-sinatra
        - intro api sinatra http://carletonatwater.com/2016/api/
        - api sequal sinatra https://www.toptal.com/ruby/api-with-sinatra-and-sequel-ruby-tutorial
        - simple sinatra api https://medium.com/@gwilakers/a-simple-sinatra-api-2d0653ec8e9a
        - sinatra json api example https://github.com/sklise/sinatra-api-example
        - sinatra api https://www.sitepoint.com/uno-use-sinatra-implement-rest-api/
        - how to sinatra api https://x-team.com/blog/how-to-create-a-ruby-api-with-sinatra/
        - Graphql vs rest https://dev-blog.apollodata.com/graphql-vs-rest-5d425123e34b
        - rest vs graphql https://blog.pusher.com/rest-versus-graphql/
        - rest vs graphql https://www.infoq.com/news/2017/07/graphql-vs-rest
        - next frontier for web apis https://brandur.org/api-paradigms
        - graphql vs rest vs hateoas https://dennisseidel.de/graphql-vs-rest-vs-hateoas/
        - is graphql end of rest https://nordicapis.com/is-graphql-the-end-of-rest-style-apis/
        - hypermedia and graphql https://dzone.com/articles/thoughts-on-rest-linked-data-hypermedia-graphql-an
        - you might not need graphql https://blog.runscope.com/posts/you-might-not-need-graphql
        - https://philsturgeon.uk/api/2017/01/24/graphql-vs-rest-overview/
        - https://apievangelist.com/2017/03/31/rest-linked-data-hypermedia-graphql-and-grpc/
        - rest and hanami http://hanamirb.org/guides/1.0/routing/restful-resources/
          hanami getting started http://hanamirb.org/guides/getting-started/
      * Vim
        - guide to neovim http://nerditya.com/code/guide-to-neovim/
        - vim dasht https://github.com/sunaku/vim-dasht
          dasht docset install http://sunaku.github.io/dasht/man/man1/dasht-docsets-install.1.html
        - tmux shortcuts https://gist.github.com/MohamedAlaa/2961058
      * HAProxy
        - new in haproxy https://www.haproxy.com/blog/whats-new-haproxy-1-8/
        - web caching proxy baseed on HAProxy https://github.com/jiangwenyuan/nuster
        - fooling neural nets http://www.labsix.org/physical-objects-that-fool-neural-nets/
        - kafka 1.0 https://www.confluent.io/blog/apache-kafka-goes-1-0/
        - minimalist sqlite guide http://tech.marksblogg.com/sqlite3-tutorial-and-guide.html
        - activerecord-import https://github.com/zdennis/activerecord-import/wiki
        - speeding up bulk import in rails https://blog.codeship.com/speeding-up-bulk-imports-in-rails/
      * Random
        - security analysis of telegram https://courses.csail.mit.edu/6.857/2017/project/19.pdf
        - tensor compiler http://tensor-compiler.org/

        - use data object http://brewhouse.io/2015/07/31/be-nice-to-others-and-your-future-self-use-data-objects.html

        - how to speed up rails app https://www.engineyard.com/blog/5-ways-to-speed-up-your-rails-app
        - open struct can kill performance http://blog.honeybadger.io/how-openstruct-and-hashes-can-kill-performance/
          [ ] so can instantiating a list of AR object
        - X11 forwaqrding https://dyhr.com/2009/09/05/how-to-enable-x11-forwarding-with-ssh-on-mac-os-x-leopard/
        - sempahore ci https://semaphoreci.com/docs/ssh-access-to-build-environment.html
        - benerfits of semaphre https://www.sitepoint.com/continous-deployment-of-rails-with-semaphoreci/
        - ruby profiler https://ruby-doc.org/stdlib-2.1.0/libdoc/profiler/rdoc/Profiler__.html
        - .XAuthority file https://ubuntuforums.org/showthread.php?t=1863739
        - xauth http://dasunhegoda.com/gui-ubuntu-server-x11-forwarding/679/
        - more xauth https://superuser.com/questions/806637/xauth-not-creating-xauthority-file

        - [ ] beagle bone book https://www.youtube.com/watch?v=ltCZydX_zmk
        - [ ] cross compilation c/c++ for embedded https://www.youtube.com/watch?v=T9yFyWsyyGk
        - http://exploringbeaglebone.com/

        - octavo computer http://octavosystems.com/2016/05/09/osd3358-new-era-integration/
        - [ ] RasPi Projects book https://www.raspberrypi.org/magpi-issues/Projects_Book_v1.pdf

        - circle of fifths
          http://randscullard.com/CircleOfFifths/UserGuide.htm
          http://www.secretsofsongwriting.com/2012/11/22/creating-song-melodies-using-the-circle-of-fifths/
          http://intenseproductions.blogspot.com.au/2010/10/circle-of-fifths-for-songwriters.html
          http://subaqueousmusic.com/composing-music-in-the-circle-of-fifths/

        - Node learning workshopper-adventure https://github.com/workshopper/workshopper-adventure
          and how to set it up https://github.com/linclark/lin-clark.com/blob/master/content/blog/2014/07/01/authoring-nodejs-workshopper-lessons.md
          also learnyounode https://github.com/workshopper/learnyounode
          and javascripting https://github.com/workshopper/javascripting

        - [ ] css grid soccer formations http://www.opihana.com/2017/11/08/Soccer-Formations-in-CSS-Grid/

    * from goals page
      * **Goals - Jun 2017**

      * **Mastery guild**
        - [✅] running self development brownbags in streams at work to instill
          an always learning mentality at work
        - [✅] run a coding dojo series to get as many people up to speed to
          effectively and efficiently take part in TDD randori dojo

      * **New Language**
        - [❌] elm
        - [❌] elixir
        - [❌] clojure

      * **Programming**
        - [❌] POODR, Patterns & OO, Exceptions, refactoring
        - [❌] basics of FP

      * **Teach**
        - [❌] run a workshop on new technology like: functional programming, speed,
          haproxy/nginx, serverless technology, react/redux, elm
        - [❌] plan a talk

    * **Short list**
      - watch category theory lectures
        * [category theory - Bartosz
          Milewski](https://www.youtube.com/playlist?list=PLbgaMIhjbmEnaH_LTkxLI7FMa2HsnawM_)
      - Datathon Melbourne 2017
        - GraphX
        - Keras
        - Tensor Flow
        - technologies
          - Google Big Query
          - Google datalab
          - Google dataproc
          - python notebooks
      - React
        - React Quickly
        - React in Action
        - D3.js - network diagrams
      - Clojure
        - clojure applied
        - functional patterns

    * **Current themese**

    * **Data**

    * **Machine Learning**

    * **Spark**
      - [ ] setup cluster in databricks and code along with example from
        [Spark MLlib 2.0 preview](https://youtu.be/kvk4gnXL9H4). The Notebook
        was originally available at http:/dbricks.co/1UfvAH9 but not there any
        longer. I am sure something like this one
        [Saving & loading ML models](http://cdn2.hubspot.net/hubfs/438089/notebooks/spark2.0/ML%20persistence%20in%202.0.html)
        via [Spark 2.0 Preview: ML Model
        Persistence](https://databricks.com/blog/2016/05/31/apache-spark-2-0-preview-machine-learning-model-persistence.html)
        or something newer would work well too.
      - [ ] look at zepplin notebooks according to [Intro to ML Spark and Zepplin](https://youtu.be/k4KOmnenuFk)
        following http://tinyurl.com/hwx-intro-to-ml-with-spark
        to get to [Spark tutorials](https://hortonworks.com/apache/spark/#tutorials) and getting started with
        [ML spark and zepplin](https://hortonworks.com/hadoop-tutorial/intro-machine-learning-apache-spark-apache-zeppelin/)
        Data set recommendations
        - LIBSVM datasets: http://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/
        - Public datasets: https://github.com/caesar0301/awesome-public-datasets
        - Machine Learning dataset repo: http://archive.ics.uci.edu/ml/datasets.html
        - Reddit datasets: https://www.reddit.com/r/datasets/
        - Quora datasets: https://www.quora.com/Where-can-I-find-large-datasets-open-to-the-public
        - Name generator: http://www.fakenamegenerator.com/order.php
      - [ ] [Spark MLlib on Googles Dataproc](https://www.youtube.com/watch?v=6tgvHDYT_AM)
        running python on googles data lab. A good example to follow along with to start wlth
          - BigQuery on the NYC taxi public data
          - start a cluster
          - random forrest with Map output
          - save model for later use
        probably start here - from links from end of video
          - https://cloud.google.com/dataproc/docs/quickstarts
          - https://cloud.google.com/dataproc/docs/tutorials
          - MLLib http://spark.apache.org/docs/latest/ml-guide
          - NYC data https://cloud.google.com/bigquery/public-data/nyc-tlc-trips
          - Datalab https://cloud.google.com/datalab/docs/
          - dataproc initializer https://github.com/GoogleCloudPlatform/dataproc-initialization-actions

    * **Solr indexing**

    * **Graph analysis**

    * **UI**
    - React
    - D3.js data visualisation

    * **Easy list of TODOs**

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
      - [ ] look up truffleruby
            https://pragtob.wordpress.com/2017/01/24/benchmarking-a-go-ai-in-ruby-cruby-vs-rubinius-vs-jruby-vs-truffle-a-year-later/
      - [ ] if I were to evaluate frontend frameworks at this point in time they would be
        - [ ] react/redux
        - [ ] ember
        - [ ] elm
        - [ ] [Vue.js](https://vuejs.org/v2/guide/)

    * **Goals - Feb 2017**

    * **Mastery Guild**
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

    * **New Languages**
      - [ ] elixir - continue on reading basic guide
      - [ ] clojure - basic guide? books? dojo?
      - [ ] elm - basic guide from web
      - [ ] re-read react book
      - [ ] GraphQL
        - https://medium.com/react-weekly/relay-facebook-on-rails-8b4af2057152#.onrp81l7i
        - https://github.com/rmosolgo/graphql-ruby
        - https://github.com/rmosolgo/graphql-ruby-demo
        - http://graphql-ruby-demo.herokuapp.com/graphiql
        - https://facebook.github.io/relay/docs/tutorial.html#content
        - http://mgiroux.me/2015/getting-started-with-rails-graphql-relay/

    * **Programming**
      - [ ] daily dojo in ES6
        - [ ] learn the new concepts http://es6-features.org/
        - [ ] learn the jest concepts
          http://facebook.github.io/jest/docs/getting-started.html
      - [ ] regular react front ends of all the ideas

    * **Teach**
      - [ ] prepare functional Programming workshop

# Mon 20th
  * Ruby SOAP library - http://savonrb.com/
    mentions WS-Security
  * run a simple rack app on a given port
    ```
    ruby -e 'require "rack"; Rack::Handler.default.run(proc{|env| ['200', {}, []] }, Port: ARGV.join.to_i)' 49154
    ```
    as per https://rack.github.io/

# Fri 17th
  * **Computer Electronics**
    This build lite indicator https://github.com/hooroo/squinty suggest a mix of
    [neopixel](https://www.adafruit.com/category/168) and
    [moteino](https://lowpowerlab.com/guide/moteino/)

  * **Unicorn log parsing**
    - [ ] [starting with logstash](https://sematext.com/blog/getting-started-with-logstash/)
    - [ ] [parsing logs using logstash](https://qbox.io/blog/parsing-logs-using-logstash) 
    - [ ] [debugging unicorns rails timeout](http://underthehood.meltwater.com/blog/2014/03/21/debugging-unicorn-rails-timeouts/)
    - [ ] [fluentd?](https://groups.google.com/forum/#!topic/fluentd/5i1bq5O-tEE)
    - [ ] [GoAccess](https://goaccess.io/faq)
    - [ ] [alternatives to awstats](https://alternativeto.net/software/awstats/?platform=mac)
    - [ ] [how to merge nginx logs](https://www.cyberciti.biz/faq/unix-linux-merging-multiple-access-logs-with-logfile-merger/)
    - [ ] [awstats](https://sourceforge.net/projects/awstats/?source=typ_redirect)
      - [ ] perl script to merge log files
    - [ ] sumologic - https://www.sumologic.com/blog/log-management-analysis/analyze-log-files/
    - [ ] using unix tools https://www.loggly.com/ultimate-guide/analyzing-linux-logs/
    - [ ] https://www.manageengine.com.au/products/eventlog/unix-auditing-and-reporting.html?cam=141652717&adgid=20068335877&kwd=unix%20log%20analyzer&loc=9071424&gclid=EAIaIQobChMI_uyqsOS81wIVxhwrCh2J2QTKEAAYASAAEgIM3PD_BwE

  * **Machine learning**
    - command line tools? https://www.linkedin.com/pulse/command-line-tools-machine-learning-marios-michailidis/
    - https://dzone.com/articles/big-data-ml-dl-command-line-tools
    - via HN?
    - https://opensource.com/article/17/2/command-line-tools-data-analysis-linux

  * **Concurrency**
    - [Intro to concurrency modelss with ruby I](https://engineering.universe.com/introduction-to-concurrency-models-with-ruby-part-i-550d0dbb970)
      Good intro on:
        - processes using `fork` but no shared memory
        - threads but limited by GIL to 1 thread unless they are sleeping
        - EventMachine using linux select (synchronous I/O multiplexing), good for a lot of I/O operations but seem complex and on the way out
        - fibers to repalce nested callbacks
    - [Intro concurrency with ruby II](https://engineering.universe.com/introduction-to-concurrency-models-with-ruby-part-ii-c39c7e612bed)
      - Actors (Erlang and Scala) share memory by communicating, ie no shared state, ruby has Celluloid usese threads and fibers underneath

# TODO fix below
rails camp 22 presentations
  sockets using active table?
  mpearson - unity game
  bombora puzzle
  like capybara thing cypress.io step through all history
  active model to talk to neo4j

ember and sinatra/hanami api?
sinatra api and download sample
https://spring.io/understanding/HATEOAS

* Sat 11th
  * **Rust**
    - [ ] how do I deal with being offline and dependencies? is there a cache where things get stored?
    - [ ] set rust in vim to 2 spaces?
  * **Vi**
    - [ ] type ^M characters? to match and remove
    - [ ] switch horizontal to vertical split
    - [ ] comment

    retro - pi - game console

    diet pi

    arm-bian

    orange pi - arm-bian
    apple pi?
    banana pi?

    esp 8266 32

    ftdi cable
    arduino ide
    add to mamager but could be bundled 8266-12

    low power wifi - runs open thread - ali express - board CC2538 $10 clock speed 160Mhz .5 Mb 32k ram


* Thu 9th
  * **offline documentation for rails camp**
  * dasht
  ```
    brew install dasht

    dasht-docsets-install bash    # install bash docset
    dasht 'c - x'                 # search
    dasht-server                  # to access via web

    man dasht
  ```

  * **Ras Pi finger print reader**
    * https://tutorials-raspberrypi.com/how-to-use-raspberry-pi-fingerprint-sensor-authentication/
    * [ ] [Fingerprint Sensor Project](https://www.raspberrypi.org/forums/viewtopic.php?t=84572)
    * [ ] [RASPIREADER: BUILD YOUR OWN FINGERPRINT READER](https://www.raspberrypi.org/blog/raspireader-fingerprint-scanner/)
    * **Ras Pi Cases**
      * https://tutorials-raspberrypi.com/raspberry-pi-3-cases-2b/
    * **Book**
      * [Exploring Raspberry Pi: Interfacing to the Real World with Embedded Linux](http://au.wiley.com/WileyCDA/WileyTitle/productCd-1119188687.html)
      * code https://github.com/derekmolloy/exploringrpi
      ```
      git clone https://github.com/derekmolloy/exploringrpi.git
      ```
  * **Sound on computer**
    * [github freealut library for OpenAL](https://github.com/vancegroup/freealut)
    * https://www.openal.org/
    * https://github.com/mdoege/PyScape
    * http://boodler.org/lib/

* Wed 8th
  * **Rails Camp** prep
    * **Ruby extensions**
      - [ ] http://blog.reverberate.org/2016/06/12/native-extensions-memory-management-part1-ruby-mri.html
      - [ ] [Rust and C and ruby - Yehuda Katz](https://t.co/Gbkyo2fuz8)
      * using **Rust**
        - **Helix**
          - [ ] [helix talk at ruby conf](http://blog.skylight.io/introducing-helix/)
          - [ ] [use helix](https://usehelix.com/)
          - [ ] [helix roadmap](https://usehelix.com/roadmap)
          - [ ] [github Helix](https://github.com/tildeio/helix)

        - **Ruru**
          - [ ] [github Ruru](https://github.com/d-unseductable/ruru)
            - [ ] [HN on ruru](https://news.ycombinator.com/item?id=11923769)
        - **case_transform-rust-extensions**
          - [ ] https://github.com/NullVoxPopuli/case_transform-rust-extensions
      * using **C++**
        - [ ] https://www.amberbit.com/blog/2014/6/12/calling-c-cpp-from-ruby/
        - [ ] https://rubyplus.com/articles/1171-Calling-Native-Library-Code-from-Ruby
        - [ ] https://github.com/jasonroelofs/rice
      * using **LUA**
        - [ ] [github rlua](https://github.com/whitequark/rlua)
        - [ ] http://lua-users.org/wiki/BindingCodeToLua
        - [ ] https://c7.se/from-ruby-to-lua/
        - [ ] https://www.compose.com/articles/a-quick-guide-to-redis-lua-scripting/

  * readline history in IRB
  ```
  puts Readline::HISTORY.to_a
  ```
  * where is my tmux shortcuts/dojo thing? needed

* Fri 3rd
  * **Rust**
    continue in ch3 of book
