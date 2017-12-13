# Progress December 2017

# Wed 12th

  * **Advent of Code**
    - [x] http://adventofcode.com/2017/day/11
    - [ ] http://adventofcode.com/2016/day/12

# Tue 12th
  * came across "Today I Learnt" https://til.hashrocket.com/ a real short form
    blog of little nuggets of knowledge

  * map select

    ``` ruby

    [1,2,3].map(&:to_s)
    => ["1", "2", "3"]

    sqr = lambda {|x| x*x }
    [1,2,3].map(&sqr)
    => [1, 4, 9]

    def neg_odd(x)
      x%2 == 1 ? -x : x
    end
    [1,2,3,4].map(&method(:neg_odd))
    => [-1, 2, -3, 4]
    ```

# Mon 11th

  * **Advent of Code**
    - [x] http://adventofcode.com/2017/day/11

# Sun 10th
  * **Advent of Code**
    - [x] http://adventofcode.com/2017/day/10

  * **PyImageSearch PPoA** Practical Pathon and OpenCV
    - [x] ch9 thresholding
    - [x] ch10 gradients and edge detection

# Sat 9th
  * **Advent of Code**
    - [x] http://adventofcode.com/2017/day/9
    - [x] http://adventofcode.com/2017/day/8
    - [x] http://adventofcode.com/2017/day/7

  * **PyImageSearch PPoA** Practical Pathon and OpenCV
    - [x] ch8 smoothing and blurring

# Wed 6th
  * **Advent of Code**
    - [x] http://adventofcode.com/2017/day/6

  * **PyImageSearch PPoA** Practical Pathon and OpenCV
    - [x] ch1 - 2 install
    - [x] ch3 loading and displaying
    - [x] ch4 image basics
    - [x] ch5 drawing
    - [x] ch6 image processing
    - [x] ch7 histograms
    - [ ] read supplamentary material for above chapters in particular
        - showing images in pgplot
        - histogram search engine
        - pattern search engines

  * **PyImageSearch Gurus Course**
    - [x] 0.1: getting yourself oriented

    * **more install**
      - based on https://gurus.pyimagesearch.com/setting-up-your-python-opencv-development-environment/
      ```
      brew install boost --with-pyton boost-python
      brew list | grep 'boost'

      mkvirtualenv gurus

      brew tap homebrew/science

      pip3 install scipy matplotlib scikit-learn
      pip3 install -U scikit-image
      pip3 install mahotas imutils Pillow commentjson

      cd ~/.virtualenvs/gurus/lib/python3.6/site-packages/
      ln -s /usr/local/lib/python3.6/site-packages/cv2.cpython-36m-darwin.so .
      ```

  * **Work related**
    - **Property based testing with JS**
      - [ ] https://medium.com/front-end-hacking/an-introduction-to-property-based-testing-with-js-verfiy-c194d60222f8
      - [ ] http://jsverify.github.io/
    * **table to record CSS transformer**
      - https://exisweb.net/responsive-table-plugins-and-patterns
      - https://www.liquidlight.co.uk/blog/article/tables-in-responsive-design/
    - [ ] look at inserting calendar invites for pagerduty https://developers.google.com/google-apps/calendar/v3/reference/events/insert

  * **Arduino**
    - [ ] read up on possibilities with [adafruit flora](https://learn.adafruit.com/getting-started-with-flora/blink-onboard-neopixel)
    * **leostick**
      - [ ] get it working locally [leostic](https://www.freetronics.com.au/products/leostick#.WicKurT1XMU)
      - [ ] or get it working with Arduino IDE
        - [leostick getting started](https://www.freetronics.com.au/pages/leostick-getting-started-guide#.WicLaLT1XMU)
        - [compatible boards](https://www.freetronics.com.au/pages/using-arduino-compatible-boards-as-external-programmers#.WicLaLT1XMU)
      - [ ] look at an alternate [AVR tool chain](http://maxembedded.com/2015/06/setting-up-avr-gcc-toolchain-on-linux-and-mac-os-x/)
        or is this simply
        [Crosspack](https://www.obdev.at/products/crosspack/index.html)? when
        would this be needed? does it even do what I need to do? or si this
        for more advanced AVR? That said it would be good to have a command
        line tool chain for deploying to arduino! one day

    - [ ] read up [arduino reference](https://www.arduino.cc/reference/en/)
    - [ ] read up [arduino tutorials](https://www.arduino.cc/en/Tutorial/HomePage)

  * **Look into**
    - [ ] [q for csv querying](http://harelba.github.io/q/)

  * **Rust**
    - [ ] [rust tdd](https://matthewkmayer.github.io/blag/public/post/tdd-with-rust/)
      - [ ] [tdd example](http://carol-nichols.com/2015/03/28/tdd-example-in-rust/)
      - [ ] https://github.com/carols10cents/prime_factors
      - [ ] https://www.reddit.com/r/rust/comments/30xcuh/tdd_example_in_rust_with_the_prime_factors_kata/
    - [ ] [game with rust on wasm](https://aochagavia.github.io/blog/rocket---a-rust-game-running-on-wasm/)
    - [ ] [Rust for Mercurial](https://www.mercurial-scm.org/wiki/OxidationPlan#)
    - [ ] [rust to unwrap or not to unwrap](https://users.rust-lang.org/t/to-unwrap-or-not-to-unwrap/10900)
    - [ ] [option unwrap](https://rustbyexample.com/error/option_unwrap.html)
    - [ ] [Pi bare metal prog with rust](https://medium.com/@thiagopnts/raspberry-pi-bare-metal-programming-with-rust-a6f145e84024)
      - https://github.com/Ogeon/rust-on-raspberry-pi
      - https://github.com/rust-embedded/rust-sysfs-gpio
      - https://news.ycombinator.com/item?id=10915735
      - https://users.rust-lang.org/t/suitability-of-rust-for-embedded-development/371
      - https://users.rust-lang.org/t/rust-for-embedded-development-where-we-are-and-whats-missing/10861
      - https://www.reddit.com/r/raspberry_pi/comments/5kosiw/rust_language_on_the_raspberry_pi/

  - [ ] [embedded elixir with nerves](http://nerves-project.org/)
    - http://embedded-elixir.com/
  - [ ] [Halite AP programming challange](https://halite.io/)
  - [ ] https://monades.roperzh.com/error-correction-reed-solomon/?cm=slack
  - [ ] https://blog.hackages.io/why-you-should-spoil-your-web-developer-team-with-training-always-4a326f0bd091

  - * **API workshop**
    - [ ] https://spring.io/understanding/HATEOAS
    - [ ] add section on etags and caching etc.

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

# Tue 5th

  * **Advent of Code**
    http://adventofcode.com/2017/day/5

  * **Arduino Advent Kit**
    * [Day 5 - button](http://guides.littlebird.com.au/Guide/Arduino+Advent+Calendar+Day+05+-+Button/24)
    * [Day 6 - rgb led](http://guides.littlebird.com.au/Guide/Arduino+Advent+Calendar+Day+06+-+RGB+LED/25)

# Mon 4th

  * **Advent of Code**
    http://adventofcode.com/2017/day/1

  * **Arduino Advent Kit**
    from Little Bird https://www.littlebirdelectronics.com.au/arduino-advent-kit-unboxed

    * [Day 1 - flash onboard led](http://guides.littlebird.com.au/Guide/Arduino+Advent+Calendar+Day+01+-+IDE/20)
    * [Day 2 - flash, flicker and dim external led](http://guides.littlebird.com.au/Guide/Arduino+Advent+Calendar+Day+02+-+Fade+Flicker+and+Twinkle/21)
    * [Day 3 - light sensor and serial connection](http://guides.littlebird.com.au/Guide/Arduino+Advent+Calendar+Day+03++-+LDR+Light+Sensor/22)
    * [Day 4 - temp sensor](http://guides.littlebird.com.au/Guide/Arduino+Advent+Calendar+Day+04+-+Temperature+Sensor/23)

