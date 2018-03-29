# Progress March 2018

# WIP - fresh in my head

  * **Rust** - do some more conding, where is the book up to, exercisms
  * **Ember** - learn more ember
  * **Domain Modelling** - continue work here
  * **Rails Camp** - what to do? finish last project? pi-top and
  * **Scouts** - OCR and translation of wendro badges book

# TODO
  - start udemy course
  - ember data ch1 finish
  - next part of API-workshop
  - read up on DDAU below
  - Domain Drills initial commit
  - Linked in certify this
  - Rust book
  - rails camp prep with tamadillo
    - ras pi coding
    - arduino
    - art installation ideas
    - knitting ideas
    - t-shirt design
    - work through scratch book
  - wrap up pyImageSearch book and read recent blog posts

# Thu 29th
  - **Ember**
    - [x] https://medium.com/@eluciano11/from-ember-to-react-5c2faa0e8d10
      * 2016 so not sure how relvant
      * same old React is a lib not a framework
      * appreciate the convention of Ember
      * go buildl something in another framework and you will become a better developer
      * from the comments a mention of ember-redux which may be worth a look
        - [x] http://www.ember-redux.com/ddau/
          * Data down, actions up
          * very react like and JSX like style with embeded `layout: hbs...` handlebars tempaltes
          * should check out the lib
          * idea of keeping to strict presnetational and container componenets
          - [ ] https://medium.com/@dan_abramov/smart-and-dumb-components-7ca2f9a7c7d0 
          - [ ] and demo implementation https://gist.github.com/chantastic/fc9e3853464dffdb1e3c
        - [ ] https://medium.com/@dan_abramov/smart-and-dumb-components-7ca2f9a7c7d0 more on presnetational and container components
        - [ ] https://github.com/ember-redux/ember-redux
        - [ ] http://www.ember-redux.com/

      * makes me feel the API process is
        1. Rest
        1. JSON API
        1. GraphQL (ember-graphql)
        1. Redux

  - **DI in ember**
    - [ ] https://www.codeschool.com/blog/2016/06/14/understanding-dependency-injection-in-ember/
    - [ ] https://balinterdi.com/blog/dependency-injection-in-ember-dot-js/
    - [ ] https://guides.emberjs.com/v2.11.0/applications/dependency-injection/
    - and on transitionging in ember
      - [ ] https://balinterdi.com/blog/replacing-items-in-browser-history-in-ember-dot-js/
      - [ ] https://discuss.emberjs.com/t/storing-and-returning-to-a-previous-state/7023/2
      - [ ] https://stackoverflow.com/questions/28816134/emberjs-go-back-on-cancel with jsbin example http://emberjs.jsbin.com/ciwime/1/edit?html,js,output
    - maintina scorll position in history https://gist.github.com/jayphelps/0bfc9c5b080deefa51c2
    - history feature https://discuss.emberjs.com/t/location-history-feature-and-unbookmarkable-route-urls/1248

# Wed 28th
  - look through comments on HN around [Choosing Ember over React in 2016](https://blog.instant2fa.com/choosing-ember-over-react-in-2016-41a2e7fd341)
    - https://news.ycombinator.com/item?id=12970071
    - key points that it is a framework
    - some open source examples
      - https://github.com/TryGhost/Ghost-Admin
      - https://github.com/HospitalRun/hospitalrun-frontend
      - https://github.com/hummingbird-me/hummingbird-client
      - https://github.com/travis-ci/travis-web
    - generally 2016 and out of date for the comments to be much use

# Sat 24th
  - Plan
    - [ ] Ember data chapter 1
      - wip on ember/ember-data-in-the-wild/ trying to find a logical way to
        incrementally build an App to display some data on a page. Then with
        relationships, then probably components?
    - [ ] more on API-workshop - to extracted challenge as YAML file
    - [ ] Track my thing as ember on heroku
    - [ ] plan/start on:
      - [ ] knitting pattern app
      - [ ] CSS challenges
      - [ ] Domain design drills - story to code
      - [ ] Ember components: dashboard, flip over panels, bulldog clip of
        receipts, skewmorphism challenges

# Tue 20th
  - [x] https://sdtimes.com/os/lg-launches-open-source-version-webos/
    webOS is now opensource
    - [ ] checkout http://webosose.org/ for anything cool
  - [x] started on my API to teach API's https://github.com/saramic/api-workshop

# Sat 17th
  * **Pi-top**
    original pi-top SD card seemed to have been fried. When plugged into mac it
    reporte 'The disk you inserted was not readable by this computer.' also
    when trying to burn an image using `dd` it would say `dd: /dev/rdisk2:
    Permission denied`. In the end I got a fresh SD card and it worked. I
    downloaded the pi-top image via the pi-top site:
    https://pi-top.com/products/os/ then followed following instructions

    ```
    diskutil list
    /dev/disk2 (external, physical):
       #:                       TYPE NAME                    SIZE       IDENTIFIER
       0:     FDisk_partition_scheme                        *15.9 GB    disk2
       1:             Windows_FAT_32 NO NAME                 15.9 GB    disk2s1


    $ sudo diskutil unmountDisk /dev/disk2
    Unmount of all volumes on disk2 was successful

    $ sudo dd if=2017-10-13-pi-topOS.img of=/dev/rdisk2 bs=1m

    # pressing CTRL-T during process shows progress

    load: 1.82  cmd: dd 13540 uninterruptible 0.01u 2.61s
    3052+0 records in
    3051+0 records out
    3199205376 bytes transferred in 229.873647 secs (13917234 bytes/sec)
    ```
    based on https://askubuntu.com/questions/215262/dd-dev-disk4-permission-denied-error-when-making-liveusb-on-mac-os-x

  * **Pinball machine**
    Given how expensive they are it may be interesting to build one?
    - video Ben Hack Show - https://www.youtube.com/watch?v=2KBVu5YLzZI
      - element 14 sponsored - so presumably you can get pieces there?
      - https://www.element14.com/community/community/experts/benheck/mini-pinball-kit
      - parts of a pinball machine things like tilt sensors allowing some level of cheating
        https://www.pinballsales.com.au/the-important-parts-of-a-pinball-machine/
      - is there a better source of parts? like new parts? http://www.pinballspareparts.com.au/
    - instructable
      - http://www.instructables.com/id/Making-a-Pinball-Machine/
      - http://www.instructables.com/id/DIY-Star-Wars-Pinball-Machine/
      - http://www.instructables.com/id/How-to-Build-an-Arduino-Pinball-Machine/
    - blogs
      - https://howtobuildapinballmachine.wordpress.com/
    - pro pinball factory - https://www.popularmechanics.com/technology/design/a25824/stern-pinball-machine-factory/
    - book but seems to make a crappy cardboard one [Pinball Science](https://www.booktopia.com.au/pinball-science-ian-graham/prod9781760294243.html)
    - heap of demos using cardboard
      - https://www.youtube.com/watch?v=kLyXSEzyotY
      - https://www.youtube.com/watch?v=7mlLDgRAFh0
      - https://www.youtube.com/watch?v=NB8DabxOQiY
  * **LAN game options**
    - http://www.keeptalkinggame.com/
    - free linux https://beebom.com/best-linux-games/
    - Rusted Warefare (steam)
    - age of empires?
    - dawn of war?
  * **Treasure Hunt Resources**

    - real life treasure hunts - https://io9.gizmodo.com/the-most-astonishing-real-life-treasure-hunts-1181644705?IR=T
    - ideas https://www.pinterest.com.au/explore/treasure-hunt-clues/?lp=true
      - balloons with clues inside
      - a message and a specific cut out to read the clue from the message
      - telephone keypad
      - morse code
      - puzzle pieces
      - a map (need a clue to find out what the map is mapping)
      - http://www.queen-of-theme-party-games.com/ciphers-puzzles-codes-treasure-hunt.html
        - ciphered clues
          encoded, vertical strips with numbers on top, message down below, get
          all strips, align with numbers, read the message
        - cipher in a maze - solve the maze to get letters in order to get the
          message
        - message in decode wheel
        - [ ] write app to build these
      - carboard crypt safe http://www.instructables.com/id/Cardboard-Cryptex-Safe/
      - clues given by compass bearings - get clues in the right order to get the right message
    - list of things to get like
        darg green leaf, light green leaf, pine needle, tree trunk lying on the
        ground, seed of any kind, smooth rock, rock with rough edges, pebble
        smaller then a pea, rock bigger then your fist something with bright
        colors, something wet, something alive, something prickly, something
        that makes a noise when you touch it, smoething that feels nice,
        something with 4 legs
    - photo scavenger hunt - https://boyslife.org/hobbies-projects/funstuff/134556/put-together-a-photo-scavenger-hunt/
      15 photo clues for 1 hour hunt
      teams find the photo clue, answer a question at the location and get next clue
    - all the ideas for clues http://www.treasure-hunt-ideas.co.uk/all-ideas
    - more clues http://www.treasure-hunt-ideas.co.uk/free-treasure-hunts/free-harder-indoor-treasure-hunt
    - pigpen code https://sites.google.com/site/codesforscouts/pigpen
    - some more ideas like unnatural fruit
      - http://www.inquiry.net/outdoor/games/mackenzie/outdoor/treasure_hunts.htm
      - http://www.inquiry.net/outdoor/games/wide/treasure_type_uk.htm
      - http://www.inquiry.net/outdoor/games/wide/treasure_type.htm

# Wed 14th
  * [ ] read this book on computer from first principles NAND to tetris
    http://nand2tetris.org/course.php
  * came across webp format today
    eg https://static.ffx.io/images/$width_320/t_resize_width/t_sharpen%2Cq_auto%2Cf_auto/88081e44ea342dec8cf39c38749825a80ca546b4
    eg https://static.ffx.io/images/$width_7000/t_resize_width/t_sharpen%2Cq_auto%2Cf_auto/88081e44ea342dec8cf39c38749825a80ca546b4
    using `brew install webp` to install
    `cwebp` to convert to webp
    `dwebp` to convert from webp
    example of 6400 x 4266 image
    webp size 922k and in JPEG 17M

# Thu 8th
  * **Ember**
    - https://thejsguy.com/2016/01/09/handling-errors-with-ember-data.html
      * JSON-API errors response { "errors": [...] }
      * ... "source": { "pointer": JSON pointer } ...
      * JSON pointer slash based syntax `data/attributes/name`
        for a get
        ```
        { "data": { "attributes": { "name": "..." } } }
        ```
    - Old DS.RESTSerializer or DS.JSONSerialzer
      ```
      { "errors": { "key": ["value"] } }
      ```
    - [ ] read https://leanpub.com/emberdatainthewild
      https://github.com/skaterdav85/ember-data-in-the-wild

# Mon 5th

  * **Ember**
  * [ ] look at articles on this site
    https://karolgalanciak.com/test-driven-ember/
  * [ ] demo ember/frontend examples in paste bin as per below
    http://emberjs.jsbin.com/denicage/1/edit?html,js,output
  * [ ] how to access an existing component on a page? or filter to other components - particular example around file uploader
    https://stackoverflow.com/questions/28759015/how-to-access-a-known-ember-component-from-console
  * [ ] file picker, uploader, progressive display of processing a file
    - https://emberobserver.com/addons/ember-file-upload
    - http://centerforopenscience.github.io/ember-osf/files/addon_components_file-chooser_component.js.html
    - https://www.npmjs.com/package/ember-cli-filepicker
    - https://www.npmjs.com/package/ember-filepicker
    - http://mockra.com/2016/02/13/ember-s3-file-upload
    - http://scribu.net/blog/cross-browser-uploads-ember-moxie.html
  * [ ] reporting dashboard in ember
    - https://github.com/shaialon/ember-admin-dashboards
    - https://medium.com/@jatescher/creating-a-metrics-dashboard-with-ember-js-bootstrap-and-rails-part-1-b11cf922408d
    - http://www.samselikoff.com/blog/ember-d3-simple-dashboards/
    - http://blog.juliantescher.com/creating-a-metrics-dashboard-with-emberjs-bootstrap-and-rails-part-two
  * [ ] ember screen casts
    https://www.emberscreencasts.com/posts/82-introduction-to-services
  * [ ] functional JS utils
    https://gist.github.com/bendc/9b05735dfa6966859025

  * **Ruby Hacks**
    - [ ] eager loading polymorphic association - get a decent example
      https://makandracards.com/makandra/28347-eager-loading-polymorphic-associations
    - [x] fixed width some csv

    ```
    echo "column 1,a really long column name 2,column_3
      val 1, val 2, val3
      A,B,C" | ruby -e 'require "CSV"; vals = ARGF.read; widths = CSV.parse(vals).each_with_object({}) {|csv, hash| csv.each_with_index {|v, i| hash[i] ||= 0; hash[i] = v.chars.length if v.chars.length > hash[i] } }; CSV.parse(vals).each {|csv| puts widths.map{|k,v| sprintf("%#{v+2}s", csv[k]) }.join("") }'

      column 1  a really long column name 2  column_3
         val 1                        val 2      val3
             A                            B         C
    ```

    - [ ] git commit trajectory on history of recent commit frequency
      https://github.com/ruby-git/ruby-git
    - [ ] how to compare various commits in git as 1 united patch?
      https://www.linuxquestions.org/questions/linux-software-2/concatenate-multiple-patches-into-one-file-912349/


  * **Citizen Metadata Tracker**
    - https://www.theglobeandmail.com/news/world/china-using-big-data-to-detain-people-in-re-education-before-crime-committed-report/article38126551/
      * China tracking: fertilizer purchases, large food shopping, faical
        recoginition, number plate tracking, etc to predict terrorism
      * Alibaba also has demonstrated similar things

# Fri 2nd

  * [ ] ember hooks
    https://alexdiliberto.com/posts/ember-route-hooks-a-complete-look/
