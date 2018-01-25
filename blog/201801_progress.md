# Progress January 2018

# WIP
  * **Advent of Code**
    - [ ] http://adventofcode.com/2016/day/14
    - [ ] http://adventofcode.com/2016/day/16 part 2
    - [ ] http://adventofcode.com/2016/day/17
    - [ ] http://adventofcode.com/2016/day/18 part 2
    - [ ] http://adventofcode.com/2016/day/21
    - [ ] http://adventofcode.com/2016/day/22
    - [ ] http://adventofcode.com/2016/day/24
    - [ ] http://adventofcode.com/2016/day/25

    - [ ] [pull solutions from reddit](201712_progress.md)
    - [ ] [graph algos from previous year](201712_progress.md)
    - [ ] [more on hexagon systems](201712_progress.md)

  * **Rust**
    - [ ] look at ch5/ch5-cpu4 for multiplication and other operations
    - [ ] look at above to solve the assembly problems in advent of code
    - tdd
    - other things from 201712_progress.md

  * **API workshop**
    * publish it and look at [etags](201712_progress.md) etc

  * **learning ember**

  * **PyImageSearch PPoA** Practical Pathon and OpenCV
    - ch11?
    - supplamentary material
    - probably have more of a read of the blog https://www.pyimagesearch.com/

  * **Work related**
    - **Property based testing with JS**
    - pager duty calendar invites

  * **Arduino**
    * **Adafruit Flora**
    * **leostick**

  * **Watch**
    - [ ] [RubyConf AU 2013: Keith and Mario’s Guide to Fast Websites by Keith Pitt & Mario Visic](https://www.youtube.com/watch?v=d3e5zaiBR-c)
    - [ ] [Guy Steele Clojure conf 2017](https://www.youtube.com/watch?v=dCuZkaaou0Q)
      - history and changes in CSM - Computer Science Metanotation
      - history of regex 3 decades of development till 1981 since then mostly unchanged
      - hisotry of BNF - Backus-Naur form
      - [x] https://youtu.be/dCuZkaaou0Q?t=1677
        - wild variance in substitution symbols
        - hisotry of underline - quite intersting
      - [ ] https://youtu.be/dCuZkaaou0Q?t=2482

  * **Arduino Advent Kit**
    - from Little Bird https://www.littlebirdelectronics.com.au/arduino-advent-kit-unboxed
    - http://guides.littlebird.com.au/c/Arduino

    * [Day 7] onwards

  * **Exercism.io**
    * Updates
      * ruby: roman-numerals (remove special and loop in loop)
    * ruby: run-length-encoding
    * rust: raindrops

  * **Git**
    * on mass author changes? or comment updates?
      https://stackoverflow.com/questions/14332551/whats-the-fastest-way-to-edit-hundreds-of-git-commit-messages

  * **Book shortlist**
    - [ ] [Ethereum
      DApps](https://www.manning.com/books/building-ethereum-dapps) - learn how
      this could be used
    - [ ] [C++ Concurrency in
      action](https://www.manning.com/books/c-plus-plus-concurrency-in-action-second-edition)
    - [ ] [GraphQL in Motion](https://www.manning.com/livevideo/graphql-in-motion)

  * **Scouts**
    - [ ] history facts shortlist
    - [ ] build all the fires
      - books?
        - [How to Build a Fire: A Field Guide](https://www.amazon.com/How-Build-Fire-Keeping-Burning/dp/1604337001)
        - [Complete book of fire](https://www.amazon.com/Complete-Book-Fire-Building-Campfires/dp/0897326334)
        - [Ultimate book of fires](https://www.amazon.co.uk/Little-Book-Building-Fires-Scrunch/dp/1786696479)
          - scented fires

    - [ ] tech camping
      - video survailance and recognition - face recognition, night capture
      - communications - radio
      - proximity detection - bluetooth bracelets
      - permiter fencing - lazer

    - [ ] songs based on Vaiana (Moana)
      - [Vaiana: Skarb Oceanu Piosenki](https://open.spotify.com/album/4MY5j9qqsdnyKic72hYGPX)
      - https://ising.pl/natalia-nykiel-pol-kroku-stad-vaiana-skarb-oceanu-tekst
      - http://www.tekstowo.pl/piosenka,weronika_bochat,pol_kroku_stad__vaiana___skarb_oceanu_.html
      - http://www.tekstowo.pl/piosenka,maciej_malenczuk,blyszczec___vaiana_skarb_oceanu_.html
      - http://www.tekstowo.pl/piosenka,sylwia_banasik,pol_kroku_stad__vaiana__skarb_oceanu_.html
    - songs
      - [ ] w kręgu watry
      - [ ] harcerka ta
      - [ ] other one from Hania

    - On internet safety
      - [ ] interesting data hanging around https://www.tapatalk.com/groups/unofficialzhpau/zhp-general-discussion-f1/
    - hikes
      - [Kosciuszko Huts Association](https://www.khuts.org/)

  * **School**
    - is it possible to have a python notebook describing all maths in [math methods unit 1 - 4](https://www.australiancurriculum.edu.au/senior-secondary-curriculum/mathematics/mathematical-methods/?unit=Unit+1&unit=Unit+2&unit=Unit+3&unit=Unit+4) ?
    - communications main lesson
      - [Make a telegraph](http://w1tp.com/perbuild.htm)
      - [basic transmitter](http://scitoys.com/scitoys/scitoys/radio/am_transmitter.html) or [link](http://www.instructables.com/id/Make-a-simple-AM-transmitter/)
        - modify to just use key
        - a more complex [morse CW transmitter](https://makerf.com/posts/mighty_simple_shortwave_transmitter)
      - make a [xtal receiver](http://sci-toys.com/scitoys/scitoys/radio/radio.html) to receive transmitter signal
      - change basic transmitter to transmit voice
      - optional data signals using rtl-sdr
      - radio in nature [Tesla Spirit Radio](http://www.instructables.com/id/Spooky-Tesla-Spirit-Radio/)

  * **Radio**
    - [ ] sdr down converter https://makezine.com/2013/01/23/mint-tin-software-defined-radio/

  * **Telescope**
    - https://www.opticscentral.com.au/saxon-3-3-inch-mini-dobsonian-w-accessory-kit.html
    - http://www.007telescope.com/ and https://www.youtube.com/watch?v=VwpIUzS5PA0

# Thu 25th

  * **Domain Modelling Exercisms**

# Fri 12th

could see if still scrolling

    def element_position(element)
      Capybara.evaluate_script <<-EOS
           function() {
             var element = document.evaluate('#{element.path}', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
             var rect = element.getBoundingClientRect();
             return [rect.left, rect.top];
           }();
      EOS
    end
    => :element_position

    0> element_position('.header-title')
    => undefined method `path' for ".header-title":String
    Did you mean?  pathmap

    0> element_position(page.find('.header-title'))
    => [150, -91]


# Thu 11th
  * **Hack**
    base64 encode a class in an __END__ DATA block and execute

    ```ruby
    $ cat > demo.rb
    #!/usr/bin/env ruby

    require 'base64'
    eval(Base64.decode64(DATA.read))

    puts HelloWorld.greeting

    __END__
    Y2xhc3MgSGVsbG9Xb3JsZAogIGNsYXNzIDw8IHNlbGYKICAgIGRlZiBncmVldGluZwogICAg
    ICAiSGVsbG8gV29ybGQhIgogICAgZW5kCiAgZW5kCmVuZAo=
    ^D

    $ ruby demo.rb
    Hello World!
    ```

  * **POODR**
    - [x] ch1 - OOD (Object Oriented Design)
      - procederal vs object oreinted
      - need for changes (updates) in the system
      - OO is about a set of coding techniques to managing dependencies
      - need to build for now feature and change in future
      - future change will eclipse initial beta release
      - purpose of design is to enable you to do it later and reduce cost of
        change
      - design principles like SOLID based on design choices that made changes
        later easier - backed by science
      - idea of GoF design patterns
      - act of design with all these tools is still hard
      - easy to forget design with easy access ruby script and rails sites
      - no BUFD (Big upfront design) but OOD only deals with organising code
        for future chagne
    - [ ] ch2 - Designing classes with single responsibility
      - foundation is the message but class is more visible
      - messages are core to design
      - this chapter starts with classes
      - repeat idea that you can build for today but OO is about changes in the future
      - TRUE code
        - Transparent - obvious consequences
        - Reasonable - cost == benefit of change
        - Usable - to new and unexpected contexts
        - Exemplary - encourage to perpetuate these qualities
      -

# Wed 10th
  * **Exercism.io**
    * http://exercism.io/saramic
    * ruby: nth-prime, grains, bob
    * Updates
      * ruby: bob, run-length-encoding, grains, difference-of-squares, word-count

    - [ ] idea for higher level exercism
      * given: data, process flows, test suite, score, external test suite
      * model a known domain: twitter, blog, shop, uber, scrabble, spotify,
        dropbox, search, (name web unicorn), fresho!
      * **Eg. twitter**

      ```ruby
      # YAML, json, ActiveRecord, CSV, hash, DATA block - format?
      User{'name' => 'John', 'id' => 1}
      User{'name' => 'Sally', 'id' => 1}
      Tweet{'user_id' => 1, 'text' => 'my first tweet'}
      Follower{'user_id' => 1, 'followers' => [2] }

      # Flows
      As a person I can sign up as a user and am able to publish tweets
      Given that there are people signed up as users and tweeting
        As a user I can follow other users and see their tweets
      block
      order
      verified
      retweet
      star
      dm

      # Test suite
      maybe using meta programing of the flows
      I create hunder users with hundred tweets and 10 followers and confirm order

      # Score
      speed?
      accuracy of inditerminant task?

      # external test suite
      not visible but only results
      ```

# Tue 9th
  * **Exercism.io**
    * http://exercism.io/saramic
    * ruby: panagram, sieve, roman-numerals
    * rust: leap

# Mon 8th
  * **Exercism.io**
    * http://exercism.io/saramic
    * ruby: gigasecond, raindrops, difference-of-squares
    * python: leap

# Sat 6th
  * **Exercism.io**
    * http://exercism.io/saramic
    * ruby: hamming, rna-transcription, word-count
    * rust: gigasecond
    * r: leap

    ```
    exercism configure --key=***
    exercism fetch ruby
    cd ~/exercism/ruby
    ruby -r minitest/pride ***_test.rb
    exercism submit ***.rb

    exercism fetch rust
    cd ~/exercism/rust
    cargo test
    exercism submit src/lib.rs

    exercism fetch r
    cd ~/exercism/r
    rscript test_***.R
    exercism submit ***.R

    exercism fetch ecmascript
    exercism fetch elixir
    exercism fetch clojure
    exercism fetch c
    exercism fetch cpp
    exercism fetch python
    ```

