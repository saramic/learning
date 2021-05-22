# Progress May 2021

* Sat 22nd May
  - Devise User and Identity for OAuth2
    https://willschenk.com/articles/2015/setting-up-devise-with-twitter-and-facebook-and-other-omniauth-schemes-without-email-addresses/
  - startup seed project in rails with all the OAuth2 signups
    https://github.com/HappyFunCorp/happy_seed

* Thu 13th May

  - static SEO directory
    - https://www.youtube.com/watch?v=wgz2-zpyLvM Anton Rails as a static site
      generator
    - generate site using [rackula](https://github.com/socketry/rackula)

    ```
    RAILS_ENV=production bundle exec rackula generate -f
    # seems to add a port in pages to find webpacked assets???
    # can I use dev environment? where would I store my data
    ```

    - serve up static site using [node https-server](https://www.npmjs.com/package/http-server)

    ```
    cd static
    npx http-server
    ```

    - finally upload to S3 [s3_website gem](https://github.com/laurilehmijoki/s3_website)

  - content for Dev vs Dev smack down
    - a lot of interesting topics at [CD YouTube channel](https://www.youtube.com/channel/UCCfqyGl3nq_V0bo64CjZh8g)
    - testing antipatters - https://bryanwilhite.github.io/the-funky-knowledge-base/entry/kb2076072213/
    - dev vs dev hating on the industry [YOW! 2014 Todd L. Montgomery & Martin Thompson - How Did We End Up Here?](https://www.youtube.com/watch?v=NKR9ZNm4Q-o)
    
  - watched monolith decomposition patterns Sam Newman - https://www.youtube.com/watch?v=9I9GdSQ1bbM

  - mutation testing [RailsConf 2017: How to Write Better Code Using Mutation Testing by John Backus](https://www.youtube.com/watch?v=uB7m9T7ymn8)
  - watch [Ted Lasso](https://en.wikipedia.org/wiki/Ted_Lasso)
  - look at map and list demos
    - http://google-map-react.github.io/google-map-react/map/balderdash/
    - examples like https://www.trivago.com.au/?aDateRange%5Barr%5D=2021-02-20&aDateRange%5Bdep%5D=2021-02-21&aPriceRange%5Bfrom%5D=0&aPriceRange%5Bto%5D=0&iRoomType=7&aRooms%5B0%5D%5Badults%5D=2&cpt2=54941%2F200&hasList=0&hasMap=1&bIsSeoPage=0&sortingId=1&slideoutsPageItemId=&iGeoDistanceLimit=20000&address=&addressGeoCode=&offset=0&ra=&overlayMode=
  - zsh vi - https://github.com/jeffreytse/zsh-vi-mode
  - more code challenge sites
    - coding game https://www.codingame.com/start
    - peer reveiwed code challenges https://geektastic.com/?utm_source=quora&utm_medium=answer&utm_content=goodchallengewebsites&utm_campaign=1000
    - https://www.codility.com/
    - https://www.hackerrank.com/
    - from https://dev.to/haycuoilennao19/10-coding-challenge-websites-for-developer-898
    - https://www.freecodecamp.org/news/the-10-most-popular-coding-challenge-websites-of-2016-fb8a5672d22f/
    - https://www.quora.com/What-are-good-coding-challenges-websites
    - https://www.codewars.com/dashboard
    - cross fading images http://css3.bradshawenterprises.com/cfimg/
  - read
    - [Centrifuge: a reliable system for delivering billions of events per day
Calvin French-Owen on May 23rd 2018](https://segment.com/blog/introducing-centrifuge/)
    - [Goodbye Microservices: From 100s of problem children to 1 superstar
Alexandra Noonan on July 10th 2018](https://segment.com/blog/goodbye-microservices/)
      - https://news.ycombinator.com/item?id=17499137
      - https://cxl.com/blog/6-user-onboarding-flows/
  - good watch on [A Brief History of Time.new - Daniel Fone Dec 23, 2017 ](https://www.youtube.com/watch?v=UjdtH5gO_DQ)
  - dynamic desktops
    - https://nshipster.com/macos-dynamic-desktop/
    - 24 hour wallpaper https://www.jetsoncreative.com/24hourwallpaper/
  - pros of trunk based development
    - Continuous Integration vs Feature Branch Workflow - Dave Farley
    - TW presents: Trunk-based Development with Michael Lihs, Chris Ford & Kief Morris
    - GOTO 2017 • Feature Branches and Toggles in a Post-GitHub World • Sam Newman
    - https://trunkbaseddevelopment.com/game-changers/
