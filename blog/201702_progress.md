# Progress Feb 2017
* Tue 28th
  * first 2 chapeters on Mastery
    * plataeus get used to them, enjoy them they are inevitable
    * 3 types:
      1. dabler - loves to start but quits in plateau after first success,
      2. obsessive - tries too hard to keep success when in plateau and finally
         it falls appart
      3. hacker - happy just to stay on 2nd plataeu
    * none of these persue mastery
    * our culture of instant gratification through things like TV has made
      riding the plateaus to mastery no acceptable to most.

* Mon 27th
  * NZ AI meetup
    * Jaco Stewart - Intro Neural Networks
      - mention guerilla gate - bad Google image tagging
      - Neural networks are:
        - not a model of human brain
        - does not need to be a black box
        - not hard to implement
      * mention of pubilicly available datasets - this is a challenge, to get big
        enough datasets
      * Kaggle.com
      - [ ] sign up to google translate
    * Andrew Masters - Microsoft Cognitive Toolkit MS CNTK
      * CEO inductive.co.nz
      * MS CNTK and brainscript/python equivalent to TensorFlow
      * in beta 12 and open source on https://github.com/microsoft/cntk
      * very fast especially on NVIDIA GPU
      * designed for multi machine out of the box
      * Example - read handwritten digits and letters for chess scoring
        * had files of test images per letter, both good and bad versions of
          letters
        * used bad as identifying scribble
        * feature set was only grey scale of pixel but could have been edge
          detection data, number of loops, number of vertical lines etc.
    * ___ http://aif.nz
      * Artifitial Intelligence Form NZ
      * start conversation, train public/media help inform policy around AI
      * how to apply to existing businesses: construction, mining, tourisnm,
        farming
      * very few startups in this area
      - [ ] AirNZ had a press release about some kind of AI bot
  * MD5 advent calculation in: perl, ruby, elixir and clojure
  * started exercises on elixir processes (elixir 1.3 prag prog book)
  
* Sun 26th
  * pairing with Hari on ruby TDD tennis and got him setup on windows
  * paring with ___ (from Brazil, now Aukland) on link shortner implementation.
  * started on MD5 in perl - it has been a long time

* Sat 25th
  * Programming Elixir 1.3 book

    iex> c("name_of_file.ex")

  * TODO meetup notes from AI meetup
  - [ ] charlespeach for pc build
  - [ ] ergodox to build awesome keyboard
  - investigate
    alias single-win="defaults write com.apple.doc single-app -bool true && killall Dock"
    alias multi-win="defaults write com.apple.doc single-app -bool false && killall Dock"
    LICEcap
  * follow Samuel on github and his teapot for clang
  * RC showcase
    * Solidus and capybara-guides to generate image grabs and docs based on
      capybara test script
    * Curses and .puz file which has a spec for crossword puzzle
    * high spirit dry-web-rota
    * edges to cats (open source tensor flow)
      * pokemon api (720 in previous to last generation)
    * envato styleguide @lukearndt
      * gem envato/guide
    * liquid templating engine in elixir (Solid there is another one fluid)
    * hpervisor
    * 3D game
    * chrome game - trex
    * learn to speak maori
    * faster JSON parser keithduncan/yajil-ruby
    * vini DB snapshot - stellar (and own nutirtion app)
    * rails camp

  *
  mix new --sup  (mix help new)
  mix run --no-halt

permenant true in mix.exs
    iex -S mix
    recompile

    iex
    h <name>

    :observer.start - observe

  * talk "Why the Functional"
    dry-rb has left/right as in scala
    referential transparency - take the functional stuff out and separte from
    stte changing

  * organising elixir project

    mix new name
    mix run -e 'ElxAdventMd5.CLI.run(["-h"])'
    mix run -e 'ElxAdventMd5.CLI.run(["abc", "123"])'

  - [ ] Sarah Mil ruby talk on writing RSpec in 25 min End of year 2014?
  - [ ] Talk by creator of clojure at RubyConf circa 2015 a keynote
  * ruby DATA and __END__ only accessible in first file loaded, won't work with RSpec
  * reminded myself of ffmpeg commands to create a animated gif, given file
    my_movie.mp4:

    create a palette file

      ffmpeg -y -t 10 \
        -i my_movie.mp4 \
        -vf fps=10,scale=320:-1:flags=lanczos,palettegen \
        palette.png

    create gif

      ffmpeg -t 10 \
        -i my_movie.mp4 \
        -i palette.png \
        -filter_complex "fps=10,scale=320:-1:flags=lanczos[x];[x][1:v]paletteuse" \
        my_movie.gif
  * elixir http://elixir-lang.org/getting-started/processes.html
    iex to run repl
    spawn new processes
    send and receive to talk between processes
    links, tasks and state
    agents probably the better way of doing this
    Idea to do split process for MD5 calculation from advent calendar
* Sat 25th
  * advent calendar day 4 - 6
  * pairing with Hari on tennis
* Fri 24rd
  * Tensor flow ch 1
  * advent calendar day 1 - 3
* Thu 23rd
  * NOTHING
* Wed 22nd
  * can run clojure via

    java -cp ~/.m2/repository/org/clojure/clojure/1.8.0/clojure-1.8.0.jar clojure.main

  * most basic clojure setup

    ```sh
      project.clj   # with a main
      ./src/        #for the main
      lein run      # to run
    ```

  * read pattern 17 memoization FP scala & clj
  * [dasht install](https://github.com/sunaku/dasht)

      dasht-docsets-install bash JavaScript ...
      dasht 'c - v'
      dasht-server

    * [vim-dasht](https://github.com/sunaku/vim-dasht)
    * whole heap of stuff in neovim/init.vim about: search by text; search
      under cursor; search highlight; specify related docsets

  * [vimdeck](https://github.com/tybenz/vimdeck)

    gem install vimdeck
    # failed to get it working with nvim so

    wget [SyntaxRange-1.02.vmb.gz](http://www.vim.org/scripts/download_script.php?src_id=23217)
    vim SyntaxRange*.vmb.gz
      :UseVimball command.
      :so %

    wget [ingo-library-1.029.vmb.gz](http://www.vim.org/scripts/download_script.php?src_id=24918)
    vim ingo-library*.vmb.gz
      :UseVimball
      :so %

    # some missing bundles?
    :NeoBundleInstall

    # maybe there was some
    https://github.com/tpope/vim-markdown

* Tue 21st
  * read pattern 16 function builder operations FP scala & clj
  * notes from RubyConfAU: learning and elm
* Mon 20th
  * read pattern 15 chain of operations FP scala & clj
* Sun 19th
  * NOTHING
* Sat 18th
  * a coding dojo in ruby - roman numerals
    maybe doing it in order of counting is not that bad after all
* Fri 17th
  * a coding dojo in ruby - roman numerals
* Thu 16th
  * a coding dojo in ruby - roman numerals
  * bash challenge 5
  * read FP in scala & clojure:
    - pattern 12 - tail recursion
      - [ ] tail call vs body with examples from clojure
        https://pragtob.wordpress.com/2016/06/16/tail-call-optimization-in-elixir-erlang-not-as-efficient-and-important-as-you-probably-think/
      - [ ] flags for javascript TCO
        `strict` and `--harmony` (v6.2.0 `--harmony_tailcalls`)
        http://stackoverflow.com/questions/23260390/node-js-tail-call-optimization-possible-or-not
    - pattern 13 - mutual recursion
    - pattern 14 - filter-map-reduce
* Wed 15th
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
* Tue 14th
  * elixir enumerables and streams
* Mon 13th
  * read Ch 3 serverless
  * started notes on RubyConfAU 2017
* Sun 12th
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

* Sat 11th
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

