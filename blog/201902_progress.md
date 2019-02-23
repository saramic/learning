# Progress Feb 2019

* Sat 23rd
  - BOOK - docker for rails developers
    - developer chapters 1 - 9

* Fri 22nd
  - playing with wifi pineapple https://www.youtube.com/watch?v=eHnQwTCKe2o
    - setting up network on mac
      - according to https://architectsecurity.org/2018/08/how-to-configure-internet-connection-sharing-between-mac-os-x-and-a-hak5-wifi-pineapple/

    ```
    ssh root@172.16.42.1
    vi /etc/config/network
    ```

    change

    ```diff
    config interface 'lan'
            ...
    -       option ipaddr '172.16.42.1'
    -       option gateway '172.16.42.42'
    +       option ipaddr '192.168.2.10'  # '172.16.42.1' is default
    +       option gateway '192.168.2.42' # '172.16.42.42' is default
    ```

    enable wifi connection sharing to pineapple, can connect

    ```
    open http://192.168.2.10:1471/
    ssh root@192.168.2.10
    ```

    can get bulletins and internet works on mac so all good

    Seemed to have run into issue where Pineapple freezes network connection
    after 5 minutes. trying the following seems to have fixed it so far?

    ```
    /etc/init.d/php5-fpm restart
    ```

    from https://forums.hak5.org/topic/37583-nano-stops-working-after-a-few-min/page/2/?tab=comments#comment-310927

    but still it has died

* Wed 20th
- look at Rails frontend trends
  - react with turbolinks
  - https://stimulusjs.org/

- TODO list
  - rubocop only on modified lines
  - prettier for ruby
  - webpack to multiple outputs
    - https://stackoverflow.com/questions/35903246/how-to-create-multiple-output-paths-in-webpack-config
  - styled reset
    - https://github.com/zacanger/styled-reset
  - deploy non ember apps through ember?
    - http://ember-cli-deploy.com/docs/v1.0.x/deploy-non-ember-apps/
    - https://github.com/deployjs/deployjs-cli
      - angular example https://medium.com/voya-tech/better-deployment-of-angular-applications-38c3c7ea1ff4
    - https://medium.com/front-end-weekly/using-react-components-in-your-ember-app-8f7805d409b0
    - or just create a plugin? http://ember-cli-deploy.com/docs/v1.0.x/creating-a-plugin/
  - read up on MVP MMF
    - http://itsadeliverything.com/minimum-releasable-feature
    - https://www.agilealliance.org/glossary/mmf/
    - http://ronjeffries.com/xprog/articles/its-all-about-value/
    - https://www.disciplinedagiledelivery.com/defining-mvp/
  - css article
    - http://nicolasgallagher.com/css-cascade-specificity-inheritance/
  - voice first dev
    - https://www.manning.com/books/voice-first-development
  - cypress workshop
    - https://github.com/DavidTNguyen/testing-workshop-cypress
  - TDD disaster
    - https://cevo.com.au/post/tdd-test-driven-disaster/
  - Vagrant and Docker
    - https://www.quora.com/What-is-the-difference-between-Docker-and-Vagrant-When-should-you-use-each-one
  - On good Ruby conferences
    - https://www.engineyard.com/blog/the-13-ruby-conferences-you-cannot-miss-in-2018
    - https://medium.com/building-ibotta/railsconf-2018-retrospective-531979e9b434
    - https://www.simplethread.com/railsconf-2018-top-10-favorite-talks/
    - https://rubyconferences.org/
  - action cable and react
    - https://medium.com/@dakota.lillie/using-action-cable-with-react-c37df065f296
    - https://medium.com/@wbdana/integrating-action-cable-with-react-the-hacky-way-240db6dca8
    - active job https://guides.rubyonrails.org/active_job_basics.html
    - https://www.sitepoint.com/action-cable-and-websockets-an-in-depth-tutorial/
    - http://laithazer.com/blog/2017/03/25/rails-actioncable-stream-for-vs-stream-from/
    - https://github.com/rails-api/active_model_serializers/tree/0-10-stable

* Sun 10th
- alternatives to geckoboard
  - [Freeboard.io](https://github.com/Freeboard/freeboard)
    - as mentioned [RasPi forum - platform for sensor data visualization](https://www.raspberrypi.org/forums/viewtopic.php?t=188963)
  - preffered from above [Corlysis](https://corlysis.com/)
  - [dygraphs](http://dygraphs.com/)
  - [Perfecting data visualization with plotly](https://engineersportal.com/blog/2017/9/24/perfecting-data-visualization-with-plotly)
    - [Plot.ly](https://plot.ly/)
  - [Cloud4RPi](https://cloud4rpi.io/)
  - time series [influxdata](https://www.influxdata.com/time-series-platform/)
    - [running tick stack on RPi](https://www.influxdata.com/blog/running-the-tick-stack-on-a-raspberry-pi/)
    - [RPi install instructions](https://community.influxdata.com/t/raspberry-pi-installation-instructions/5515)
  - [Graphana](https://grafana.com/get)

* Sat 9th
- **Video** - [A Branch in Time (a story about revision histories)](https://www.youtube.com/watch?v=1NoNTqank_U)
  - by [@tekin](https://twitter.com/tekin)
  - reason for squashing commits and _why_ in commit messages - to add logical
    reason and completness to commit and hence commit history.
  - use _pickaxe_ to help find history of a method `method_name`
    ```
    git log -S method_name -p
    ```

- **Video** - [Cats, The Musical! Algorithmic Song Meow-ification](https://www.youtube.com/watch?v=JTNPLwqJIDg)
  - by [@haubertdashery](https://twitter.com/haubertdashery) - https://www.bethanyhaubert.com/
  - good fun of trying to meow-ify a theme
  - maybe "6-pack finder" is not such a bad idea

* Sun 3rd
- **BOOK - test driven react**
  - got snapshot testing working - had typo in `jest.config.js` in
    snapshotSerializers was Serlializers so it was ignored
  - got wallaby working - was in wrong directory, needs `node_modules`
  - change eslint to single quotes and dangling commas

* Sat 2nd
- **BOOK - test driven react**
  - continue with styled testing and attempt to get wallaby working

* Fri 1st
- **BOOK - test driven react**
  - webpack setup
