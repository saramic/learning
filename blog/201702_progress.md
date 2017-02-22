# Progress Feb 2017

* Wed 22nd
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

