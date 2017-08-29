# Progress August 2017

* Sun 13th
  - [ ] Book: 7 DB - Ch8 redis
    - [ ] when `brew services start redis` and `redis-cli` then continual new line?
    - [ ] how to VI in `redis-cli`
    - [ ] ruby bundle install with no internet but local gems?
    - [ ] up to sorted sets (pp269)
    - [ ] WIP ...
    - [ ] started looking at day 3 need npm/yarn install hiredis redis csv
    - [ ] WIP ...

  - [ ] can we expand the url shortner to be the `tennis` of TDD and `scrabble` of modelling?
    - short url table
    - short url has many visit stats
    - a user owns a short url and visit stat
    - allow 2 users to merge into a single user - not complicated enough as a
      simple set operation will do it is here that the move complexity would be
      nice to have, maybe in parsing something from the site?
    - ... WIP
    - URL shortner - basics of rails
    - tennis - TDD cycles, code refactoring, small simple steps for something
      that we are not sure of
    - scrabble - basic modelling around a game, players, objects and ownership
      as well as added complexity about figuring out you need a move class to
      hold state during an attempted move, validation of move and or word,
      coming up which words need to be validated especially in a 2 words being
      created as well as complexity of scoring with potential for
      horizontal/vertical words as well as bonus scores

  - [ ] Book: 7 DB - Ch2 postgresql
    - vi in repl
      ```sh
      cat >> .inputrc
      # attempt to get vi/readline in psql
      set editing-mode vi  kkkkkk 
      ```
    - [ ] how to get more info on `\h CREATE TABLE FOREIGN KEY MATCH FULL` ?
    - windowing with `PARTITION BY`
    - [ ] read CAP theorem Appendix 2
    - [ ] updates now work on views? this a difference between books PostgreSQL
      9.0 and my 9.6.3?
    - [ ] crosstab function does not exist? and complete day 2 and wrap up
      exercises
    - how to measure speed of query in psql? how much faster is the
      text_pattern_ops index? (pp37)
    - [ ] missing `levenshtein` function (pp38)
    - [ ] missing `show_trgm` function (pp38)
    - [ ] `to_tsquery` example does not work with spaces?
    - [ ] `\h` does not seem to explain much
    - [ ] `metaphones` (pp43)
    - [ ] till the end of the chapter ...

  - [x] read <https://hacks.mozilla.org/2017/02/what-makes-webassembly-fast/>

    - webassembly more optimised from the get go for faster download and optimisation
    - [ ] what are the [JIT code tricks](https://hacks.mozilla.org/2017/02/a-crash-course-in-just-in-time-jit-compilers/)
      to make JS execute faster?
    - [ ] what is the use for webassembly
    - [ ] is there a story for rust? with webassembly?
    - optimisations around types
    - garabage collection - memory managed manually like C, more difficult but
      more predictable.
    - [ ] could read the whole article series. Ultimately what is the hello
      world example of all this?

  - [x] read [Medium: Apache Airflow and the future of data engineering](https://medium.com/the-astronomer-journey/airflow-and-the-future-of-data-engineering-a-q-a-266f68d956a9)
    - [ ] read about data engineering <https://medium.freecodecamp.com/the-rise-of-the-data-engineer-91be18f1e603#.yi1pgdgtg>
    - an interview with Apache Airflow from AirBnb
    - replaced highcharts with NVD3 (licence alignment)
      - [ ] take a look at NVD3
    - a data pipeline orchestrator? dominating batch process orchestration
      - [ ] take a look at Kubernetes (and Yarn)
    - similar in this space are Luigi (Spotify in the past), Azkaban (LinkedIn
      internal) and Oozie, where does FishFlakes, Snowflake and Looker sit?
      what about YellowFin?
    - analytics is more front of mind in startups, more likely to hire data
      scientist early on and the use of of various analytics tools:
      - [ ] mixpanel
      - [ ] Interana
      - [ ] optimizely
      - [ ] killer features of the above? watch video?
    - no longer bleading edge, read up on, how they fit in?, tooling?:
      - [ ] real-time OLAP analysis
      - [ ] anomaly detection
      - [ ] A/B testing at scale
      - [ ] user segmentation
      - [ ] cohort analysis

  clearing out some links

  **Green house**

  - [ ] <http://www.motherearthnews.com/organic-gardening/how-to-design-a-year-round-solar-greenhouse-zbcz1502>
  - [ ] google search form `spaceage greenhouse`
    look at nasa/space statino greenhouses
  - [ ] google search form `ultimate arduino greenhouse`
  - [ ] <http://gardenbot.org/>
  - [ ] apitronics around aivaries (bees)
    <https://www.postscapes.com/outdoor-wireless-sensor-platform-apitronics/>
    including video
  - [ ] smart greenhouse remote monitoring systems <https://www.postscapes.com/wireless-open-source-hydroponics-harvestgeek/>
  - [ ] IoT farming <https://www.postscapes.com/smart-agriculture/>
  - [ ] wifi plant watering <https://www.postscapes.com/wireless-plant-sensors/>

  **Polish Camping links**
  - [ ] search `pole namiotowe`
  - [ ] [Polska Federacja Campingu i Caravaningu](http://www.pfcc.eu/)
  - [ ] <https://www.poland.travel/en-gb/camping>
  - [ ] search by camping number `camping nr 122` gets you links like <https://www.poland.travel/en/camping-site/camping-nr-122-lomza> which could probably be wrapped in a better mapping solution
  - [ ] <https://www.campercontact.com/en/>
  - [ ] fly fishing
    - [ ] <http://fish.pl/>
    - [ ] <http://www.wherewisemenfish.com/Fly-fishing/freshwater-holidays/Poland-fishing-holidays>
    - [ ] <http://www.pescatravel.com/en/pesca/polonia-san/>
    - [ ] <http://www.sianki.pl/en/fly-fishing/>
    - [ ] <http://www.polishquills.com/>
    - [ ]

  **Must have tmux commands**
    - modifier key
    - start/name/detatch/list/attach/share ssh?
    - new window/rename/jump/reorganise
    - split vertical|horizontal/reorganise/resize/jump
    - look back in scrolled history/visual cut

  **When am I going to tech with...**
    - [ ] <https://spark.apache.org/docs/2.1.0/ml-classification-regression.html#random-forest-classifier>
    - [ ] cheap camera for the drone
      - [ ] <https://cycliq.com/products/fly6/>
      - [ ] bicycle saddlebag camera instructions???

* Tue 8th
  - [x] watched [YouTube: Webinar: Getting Agile with Pivotal Tracker](https://www.youtube.com/watch?v=kFQORVSDeF0)
    - no points for bugs/chores to see how non features disrupt flow
    - lots of cycles releases
    - started using mielstones?
    - see what is possible in iteration?
    - [ ] ... watch again

  - Discussed making an egg incubator with wife. It seems that there are a lot
    of cheap online ones that "hold temperature and rotate eggs". Looking at a
    MYO optioni immediately sees the cost go up as you look at pre-preprepared
    modules and the like and it could on ly be economically viable if you had a
    lot of things at hand or able to scrounge from existing cheap or at hand
    items. Still Comming up with a simple, relaltively cheap "habitat
    controller" seems like a good idea for 2 projects I have: egg incubator and
    ultimate composter. Both need to control the habitat for:
    * temperature
    * moisture
    * oxygen/ventilation
    * rotation
    * visual monitoring
    * etc
    Found so far:
    - [ ] a good Q&A to highlight the main parts of the system and potential
      solutions
      <https://www.raspberrypi.org/forums/viewtopic.php?t=75569&p=956062>
    - [ ]
      <https://blog.adafruit.com/2012/06/12/join-the-conversation-building-an-egg-incubator/>
      featuring a serious heating pad
    - [ ] attempts at some software? <https://github.com/shoal/RPi_Incubator>
    - [ ] an article on the topic <http://ijafp.com/wp-content/uploads/2016/03/KLIAFP2_42.pdf>
