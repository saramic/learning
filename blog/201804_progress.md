# Progress April 2018

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
    - room intrusion detector
  - wrap up pyImageSearch book and read recent blog posts

# Fri 20th
  - **lolcommits**

  ```
  # https://github.com/mroth/lolcommits
  gem install lolcommits
  lolcommits --enable --delay 5 --animate 4 --fork
  ```

# Thu 12th
  - **Rails**
    in looking for a good [Rails application
    template](http://guides.rubyonrails.org/rails_application_templates.html)
    for creating border hack basic-rails setup came across
    [Suspenders](https://github.com/thoughtbot/suspenders) from thoughtbot
    following their recommendation to [install QT](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit#homebrew)
    for headless capybara testing

        ```
        brew install qt@5.5
        echo 'export PATH="$(brew --prefix qt@5.5)/bin:$PATH"' >> ~/.bashrc

        gem install suspenders
        suspenders basic-rails
        ```

    augmented by adding gems

        ```
        gem "rspec-example_steps"
        gem "rspec-wait"
        ```

    and a lifecycle flow
    `spec/features/lifecycle_flows/postcard_holidays_spec.rb` initially
    implemented with HighVoltage static pages

# Wed 11th
  - **Graphql**
    - project layout
  - **Frontend Deploy**
    - [Static web publishing for Front-End Developers - surge.sh](https://surge.sh/)
    - [How to Deploy an Ember CLI app to Amazon S3 or a Linux box](https://emberigniter.com/deploy-ember-cli-app-amazon-s3-linux-ssh-rsync/)
      http://ember-cli-deploy.com/
    - [Deploy an Ember.js Listings App in 3 Steps - cosmic.js](https://hackernoon.com/deploy-an-ember-js-listings-app-in-3-steps-8a29e787804d)
    - [Build and Deploy Ember.js App with Distelli](https://pipelines.puppet.com/docs/tutorials/build-and-deploy-emberjs-app/)
    - [How to deploy an Ember CLI app to Azure Websites](https://stackoverflow.com/questions/28493629/how-to-deploy-an-ember-cli-app-to-azure-websites)
    - [Deploying a react application - netlify](https://coderjourney.com/tutorials/how-to-deploy-a-react-application/)
      https://www.netlify.com/
    - https://www.npmjs.com/package/publish-react-app
  - https://pawelurbanek.com/profitable-slack-bot-rails
    - Abot - anonymous bot for slack
    - profitable side business
    - details on setup
    - promotions etc

# Tue 10th
  - **VIM**
    - [ ] setup preferences https://github.com/carlhuda/janus
      in particular around choices that I can take to my own setup like:
      NERDCommenter, NERDTree and more
  - **Charts**
    - beautiful maps for Rolls Royce autonomous ships
      https://www.flickr.com/photos/rolls-royceplc/25250157884/in/album-72157647334399764/
    - rough JS http://roughjs.com/ for sketchy like effect reminiscent of
      [Napking LAF](http://napkinlaf.sourceforge.net/)
  - **Testing**
    - adjusting browser time for tests that use timecop on server side?
      http://metaskills.net/2012/08/07/synchronized-times-in-ruby-and-javascript-acceptance-tests-using-capybara-timecop-and-sinon-js/

# Fri 6th
  - **CSS**
    - started on book [CSS Framework Alternatives](https://www.apress.com/gp/book/9781484233986)
    - [skeleton grid](/css/skeleton-landing-page/grid-system.html)
    - [milligram grid](/css/milligram-product-page/grid-system.html) 
    - [milligram page build](/css/milligram-product-page/index.html)

  - **Skilz**
    take more of a look at https://docs.emmet.io/cheat-sheet/ but started to
    use it in Vi with `ctrl-y ,`
    ```
    html:5
    .className*3
    ```

# Thu 5th
  - **Hackday**
    - started on research for http://thecrossborder.stoneandchalk.com.au/
    - https://github.com/saramic/the-cross-border-hackathon-demo

# Wed 4th
  - **CSS**
    - continuing on an initial solution of [coffee cup top](dojo/css/coffee_cup_top)
    - getting my head around various path drawing options: Berzier curves with
      1 and 2 control points and Arcs
    
# Wed 4th
  - **CSS**
    - start on CSS dojo from photos of common designs around the place
      - [coffee cup top](dojo/css/coffee_cup_top)
    - take a look at some books
      - via https://pineco.de/level-up-with-these-css-books-in-2018/
        - [ ] CSS in depth
        - [ ] Enduring CSS
        - [ ] CSS refactoring
        - [ ] Atomic design
        - [ ] CSS secrets
      - via https://bookauthority.org/books/new-css-books
        - [ ] CSS Framework Alternatives - Explore Five Lightweight
          Alternatives to Bootstrap and Foundation with Project Examples
        - [ ] CSS in depth
        - [ ] Html and Css - Learn Html And Css In 2 Hours
        - [ ] CSS - The Definitive Guide: Visual Presentation for the Web
        - [ ] **for kids maybe?**
          Get Coding! Learn HTML, CSS, and JavaScript and Build a Website, App,
          and Game

# Tue 3rd
  - **GraphQL**
    - started udemy course LINK
      - NOTES
  - **Computers in education**
    - https://codekingdoms.com/ another minecraft to teach kids but only to
      teach how to program with java mods to games, the games are still dragons
      and killing
    - https://code.org/
    - [ ] https://www.codecademy.com/ signup required?
    - [ ] http://www.codeconquest.com/ some other thing?
    - [ ] cannot find the one I used at RB?

