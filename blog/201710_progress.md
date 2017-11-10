# Progress October 2017

* Fri 27th
  * **Ember Modals and async**
    - [ ] [follow modal write up](http://ember.guru/2014/master-your-modals-in-ember-js)
    - [ ] [write a waitUntil async qunit tests](https://discuss.emberjs.com/t/waituntil-async-helper-feedback/9444)
    - [ ] [more on async behaviour in ember](https://spin.atomicobject.com/2015/07/23/testing-asynchronous-behavior-ember/)
    - [ ] [another example of building a flash message component](https://emberway.io/adding-flash-messages-to-an-ember-app-437b13e49c1b)
    - [ ] [test modal with setTimeout](https://discuss.emberjs.com/t/test-bootstrap-modal-open-settimeout-async/7085)
    - [ ] [test ember modal?](https://stackoverflow.com/questions/27973099/ember-cli-unit-test-controller-opens-bootstrap-modal)
    - [ ] [test modal on page load?](https://stackoverflow.com/questions/39965948/ember-2-8-test-that-a-ember-bootstrap-modal-is-open-on-page-load)
    - [ ] [Ember cli flash](https://github.com/poteto/ember-cli-flash)
    - [ ] [Ember flash messages](https://github.com/sir-dunxalot/ember-flash-messages)

  * **AWS**
    why is copying some files with a wild card so hard?
    ```
    aws s3 cp s3://<path> . --recursive --exclude "*" --include "*.png"
    ```

  * **Hardware**
    pulling appart a DVD drive, here are the useful compnents to scavange as
    per [Indistructables CD/DVD
    reuse](http://www.instructables.com/id/Disassembling-a-CDDVD-reader-and-reusing-its-parts/)
    - [ ] take a good read and all the links

  * **Stepper motors**
    - 5V 28BYJ-48 With driver board ULN2003 5 Line 4 Phase [ebay $2.44](https://www.ebay.com.au/i/222563678061) [ebay $18 for 5](https://www.ebay.com.au/i/182533752230)
    - 5 Pcs 3-5V 2 Phase 4 Wire 20 Ohm 6mm Dia Mini [ebay $1](https://www.ebay.com.au/i/152737079198)
    - [ebay $2 just motor](https://www.ebay.com.au/i/282556665111) or [ebay 5pc $20](https://www.ebay.com.au/i/282653352519)
    - tiny with linear screw [ebay $3](https://www.ebay.com.au/i/252660799313)

  * **Uke**
    - [ ] learn some blues finger picking http://www.ukulelemag.com/stories/blues-ukulele-learn-to-fingerpick-deep-ellum-blues-a-rollicking-country-and-blues-favorite
      or maybe even subscribe to the magazine?

* Wed 25th
  * **Pok3r keyboard**
    so not having arrow keys kind of sux, also having no default ~ is also a
    nusance. In the end ended up using layer 2 and remapping some keys also
    layer 3 for arrow mapped keys but still a bit clumsy to switch between
    layers just to use arrow keys. Mapping the capslock to be fn would fix this
    but then I would have no easy esc key. Judging by the web this is a bit of
    a problem for quite a few people. Should I build a mini keyboard just for
    the arrow keys?

    Re program the keyboard
    ```
    FN-<          # go to layer 2 (blue LED under space bar)
    FN-R_ctrl     # second LED lights
    ESC           # key to be re mapped
    FN-SHIFT-ESC  # map to ~
    PN            # lock it in
    FN-R_ctrl     # end
    ```
    as per
      * [user manual PDF](http://www.vortexgear.tw/db/upload/webdata4/6vortex_20166523361966663.pdf)
      * [reddit programming layers](https://www.reddit.com/r/MechanicalKeyboards/comments/35uy60/guide_howto_program_your_pok3r_programming_layers/)
  * **RC**
    - [ ] take a look at something like https://hobbyking.com/en_us/h-king-volador-kit.html
  * **hardware**
    - [ ] bitscope https://tronixlabs.com.au/super-specials/bitscope-bs05u-usb-oscilloscope-logic-analyser-2-analogue-6-digital-channels-20-mhz-australia/
    - [ ] 4 letter display https://tronixlabs.com.au/raspberry-pi/display/pimoroni-four-letter-phat-for-raspberry-pi-zero-3-2-model-b-australia/
  * **Nvim**
    - [terminal emulator](https://neovim.io/doc/user/nvim_terminal_emulator.html)
  * **Ground antenna**
    - https://www.groundedreason.com/how-to-ground-an-outdoor-antenna/

* Tue 24th
  * **Ras Pi gaming machine**
    inspired by someone in Cogent office to build my own NES emulator to play retro games at home
    Requirements:
    - [ ] ras pi 3 or similar
    - [ ] power supply
    - [ ] container
      - [fancy Ras Pi Desktop Encloure $90](https://tronixlabs.com.au/raspberry-pi/new-3-model-b/raspberry-pi-desktop-enclosure-australia/)
      - [one of a number of basic encosures $3 - $20](https://tronixlabs.com.au/b-and-2-model-b-enclosures/)
      - [one with removable top for prototype boards](https://tronixlabs.com.au/raspberry-pi/new-3-model-b/pi-hat-enclosure-for-raspberry-pi-3-2-model-b-and-b-australia/)
    - [ ] 2 x controllers
      - [ ] [Carelove8Bitdo Bluetooth Wireless Classic NES Controller](https://www.amazon.com/Carelove8Bitdo-Bluetooth-Wireless-Classic-Controller/dp/B00NBN1NA4?tag=pcworld02-20&SubscriptionId=AKIAIRZJHSP2SKQIWVZA&linkCode=xm2&camp=2025&creative=165953&creativeASIN=B00NBN1NA4)
        ship Aus
      - [ ] [Tomee SNES USB Controller](https://www.amazon.com/gp/product/B0034ZOAO0/ref=oh_details_o00_s00_i00?tag=lifehackeramzn-20&ascsubtag=[type|link[postId|498561192)
        pretty purple
      - [ ] [8Bitdo SFC30 Wireless Gamepad Bluetooth Controller](https://www.amazon.co.uk/dp/B01MEFZKHZ/?tag=pocketlintc07-21)
      - [BUFFALO 2145487 Classic USB Gamepad](https://www.amazon.com/BUFFALO-2145487-Classic-USB-Gamepad/dp/B002B9XB0E?tag=pcworld02-20&SubscriptionId=AKIAIRZJHSP2SKQIWVZA&linkCode=xm2&camp=2025&creative=165953&creativeASIN=B002B9XB0E)
      - [ ] [Gam3Gear 8Bitdo NES30 Pro wireless](https://www.amazon.com/Gam3Gear-NES30-Wireless-Controller-Keychain/dp/B014RFBVGK?tag=pcworld02-20&SubscriptionId=AKIAIRZJHSP2SKQIWVZA&linkCode=xm2&camp=2025&creative=165953&creativeASIN=B014RFBVGK)
    - [ ] wireless keyboard
      - [Rii I8 Mini 2.4Ghz Wireless Touchpad Keyboard With Mouse](https://www.amazon.com/Rii-Wireless-Touchpad-Keyboard-Android/dp/B00B9996LA?tag=pcworld02-20&psc=1&SubscriptionId=AKIAIRZJHSP2SKQIWVZA&linkCode=xm2&camp=2025&creative=165953&creativeASIN=B00B9996LA)
      wire less
    Build:
      - [ ] https://www.lifehacker.com.au/2013/05/how-to-build-a-cheap-all-in-one-retro-game-console-the-easy-way/
      - [ ] https://arstechnica.com/gaming/2017/04/one-upping-the-nes-classic-edition-with-the-raspberry-pi-3-and-retropie/
      - [ ] http://www.techradar.com/news/gaming/how-to-turn-your-raspberry-pi-2-into-a-retro-games-console-1289146
      - [ ] http://www.pocket-lint.com/news/137374-can-t-buy-a-snes-classic-mini-how-to-build-your-own-retro-console-for-just-50
      - [ ] https://www.pcworld.com/article/3190347/gaming/how-to-build-a-raspberry-pi-retrogaming-emulation-console.html

* Mon 23rd
  * **RubyMine**
    take a look into performance
    - [ ] [issues IDEA](https://youtrack.jetbrains.com/issues/IDEA)
    - [ ] [reporting performance problems](https://intellij-support.jetbrains.com/hc/en-us/articles/207241235)
    - [ ] [idea slow and hangs](https://intellij-support.jetbrains.com/hc/en-us/community/posts/115000142650-idea-ultimate-2017-1-1-slow-and-hangs)

* Thu 19th
  * **Vim**
    - [ ] auto format code?
    - [ ] line up on a character?
    - [ ] sort lines?
    - [ ] tree view? nerd tree?
    - [ ] how to sort out commenting?
      https://stackoverflow.com/questions/1676632/whats-a-quick-way-to-comment-uncomment-lines-in-vim
      https://github.com/scrooloose/nerdcommenter
    - [ ]  should try vimagit https://github.com/jreybert/vimagit
      https://www.reddit.com/r/vim/comments/5lebqe/magit_but_for_vim/
    - [ ] waka time for time tracking? https://github.com/wakatime/vim-wakatime
      https://wakatime.com/
    - [ ] sort out my FZF mapping and other http://nerditya.com/code/guide-to-neovim/ as well as buffer usage
      https://github.com/junegunn/fzf/wiki/Examples-(vim)
      buffer commands http://vim.wikia.com/wiki/Buffers
      ```
      :ls           # list buffers
      :e <filename> # edit filename
      :bn           # next buffer
      :bp           # previous buffer
      :b<number>    # got to specific buffer by number
      :bd           # delete current buffer
      :bd!          # delete all buffer
      ```
    - [ ] do I get anything from ctrlp vim plugin http://kien.github.io/ctrlp.vim/ around fuzzy searching?

* Wed 18th
  * **REST**
    - [ ] take a look into nested routes, best practices and the like http://guides.rubyonrails.org/routing.html#nested-resources
    - [ ] look at REST and all the things https://stackoverflow.com/questions/797834/should-a-restful-put-operation-return-something

  * **Molding**
    - [ ] get shapes made for you https://www.shapeways.com/marketplace/tech/drone-parts/
    - [ ] look at molding as per iestra axe video
    - [ ] which printer https://all3dp.com/1/best-3d-printer-reviews-top-3d-printers-home-3-d-printer-3d/#monoprice-mp-select-mini
    - [ ] what are the good things to build with 3D printer? gears, honeycomb shapes,
    - [ ] maybe a pursa https://all3dp.com/original-prusa-i3-mk3-review/

  * **Ras Pi**
    - [ ] turn ras pi into game emulator like NES
      https://www.google.com.au/search?q=raspberry+pi+nes+emulator&oq=ras+pi+nes&aqs=chrome.1.69i57j0l5.4730j0j7&sourceid=chrome&ie=UTF-8

  * **OpenCV**
  - [ ] get python and openCV setup https://www.learnopencv.com/install-opencv3-on-macos/

* Mon 16th
  * **Learning assembler**
    since playing the [Human Resource
    Machine](http://tomorrowcorporation.com/humanresourcemachine) game with my
    son, was thinking what could be a logical next step in learning. I would
    presume it would be Assembler, then C and then move into something higher
    order like Haskel. looking on the web for assembler I found the following:
    - [ ] [TIS-100](http://www.zachtronics.com/tis-100/) similar but more formal looking game
    - [ ] [6502 programming via JS emulator](http://skilldrick.github.io/easy6502/)
    - [ ] [ARM assembler programming for Ras Pi](http://thinkingeek.com/2013/01/09/arm-assembler-raspberry-pi-chapter-1/)
    - [ ] [writing 64bit assembly on Mac OSX](http://www.idryman.org/blog/2014/12/02/writing-64-bit-assembly-on-mac-os-x/)
    - [ ] [Descent into C](http://www.chiark.greenend.org.uk/~sgtatham/cdescent/)
    - [ ] [Native Assember programming for arduino](https://www.cypherpunk.at/2014/09/native-assembler-programming-on-arduino/)
    - [ ] [AVR Assember tutorial](http://www.instructables.com/id/Command-Line-Assembly-Language-Programming-for-Ard/)
    - https://en.wikipedia.org/wiki/Human_Resource_Machine

  * **Cameras**
    - Open ROV camera https://openrov.dozuki.com/Guide/Guide+0+-+Introduction/103
      https://openrov.dozuki.com/Guide/Guide+3+-+Electronics/120
    - 1080p as per Open ROV https://www.mwave.com.au/product/genius-widecam-f100-ultra-wide-angle-full-hd-webcam-ab83737
    - spy style button hole cameras https://www.ebay.com/sch/items/?_nkw=spy+button+camera&_sacat=&_ex_kw=&_mPrRngCbx=1&_udlo=&_udhi=&_sop=12&_fpos=&_fspt=1&_sadis=&LH_CAds=&rmvSB=true
    - generic search https://www.google.com.au/search?q=1080p+camera+ras+pi+telephoto&source=univ&tbm=shop&tbo=u&sa=X&ved=0ahUKEwily_vx5vTWAhWFEpQKHWLCCRsQsxgIKw&biw=1680&bih=949
    - generic camera for bikes blog http://sf.streetsblog.org/2017/01/30/legal-update-and-getting-a-bike-camera-for-peace-of-mind/
      * cycliq fly 6 https://cycliq.com/
        * review https://www.dcrainmaker.com/2015/10/cycliq-fly6-review.html
      * rideye http://www.rideye.com/

  * **Office Hacks**
    - [ ] look at writing a slack bot

  * **Lang learning**
    - [ ] https://blog.bradfieldcs.com/in-2017-learn-every-language-59b11f68eee

  * **Calistenics**
    - [ ] try https://www.reddit.com/r/bodyweightfitness/wiki/kb/recommended_routine
    - [ ] look at book https://www.dragondoor.com/b69/
    - [ ] start practicing pistol http://www.alkavadlo.com/body-weight-exercises/pistol-squat-tutorial/

* Thu 12th
  * **Vim plugins** get a handle of how these help or not
    - [ ] https://github.com/rust-lang/rust.vim
    - [ ] https://github.com/octol/vim-cpp-enhanced-highlight - given that C is supported out of the box
    - [ ] https://github.com/xolox/vim-lua-inspect - lua
      - [ ] http://lua-users.org/wiki/LuaInspect used for above
    - [ ] https://github.com/xolox/vim-lua-ftplugin - lua?
      - [ ] https://github.com/xolox/vim-misc required for above
    - [ ] https://github.com/tbastos/vim-lua - lua
  * **Rust**
    - [ ] https://hub.docker.com/r/ragnaroek/rust-raspberry/
    - [ ] https://github.com/Ogeon/rust-on-raspberry-pi
    - [ ] https://hackernoon.com/compiling-rust-for-the-raspberry-pi-49fdcd7df658
    - [ ] https://github.com/Ragnaroek/rust-on-raspberry-docker
    - [ ] https://github.com/japaric/rust-cross
    - [ ] https://coderwall.com/p/k1wqdw/build-a-arm-linux-cross-toolchain-on-os-x-from-scratch
    - [ ] http://fserver.alburg.selfhost.me/cross-gcc-arm/00-Info
    - [ ] http://www.gurucoding.com/en/rpi_cross_compiler/index.php

* Wed 11th
  * what is http://www.shippable.com/ going on about DevOps Assembly lines? watch
    [DevOps — Getting Beyond the Happy Talk: Avi Cavale, CEO of Shippable](https://youtu.be/bJtEdTeR16Q)
    - think of deployment as a pipeline
    - pipeline should work without any human intervention (email, chat, other)
    - only then can you reach next level

  * **RabbitMQ**
    just got the "RabbitMQ in depth" book shipped from Manning - didn't even
    know I ordered it. It would be good to go through it and then apply some of
    the queue learnings and how they apply to background jobs using Sidekiq.
    Also to look at playing with it on a Ras Pi.
    look into
    - [ ] http://www.livinginthepast.org/2016/02/16/decoupling-distributed-ruby-applications-with-rabbitmq.html
    - [ ] concurrent ruby and things like https://github.com/brandonhilkert/sucker_punch
    - [ ] http://brandonhilkert.com/blog/sidekiq-as-a-microservice-message-queue/
    - [ ] https://engineering.adwerx.com/building-a-macroservice-on-rails-with-rabbitmq-and-sneakers-8a394e014a94
    - [ ] how [Sidekiq-rabbitmq](https://github.com/danielrhodes/sidekiq-rabbitmq) brings them
      together potentially

  * **OpenCV**
    Came across http://pyimagesearch.com and a lot of book material around
    doing image recognition using OpenCV. In particular of interest is
    * Barcode detection
    * image detection in video
    * Ras Pi images with OpenCV precompiled
    Need to
    - [ ] Read the sample chapter
      https://www.pyimagesearch.com/static/ppao-sample-chapter.pdf
      and resource guide
      https://www.pyimagesearch.com/wp-content/uploads/2014/02/ImageSearchEngineResourceGuide.pdf
    - [ ] play with the barcode code
      https://www.pyimagesearch.com/wp-content/uploads/2014/11/detecting-barcodes-in-images.zip
    - [ ] see how hard it is really to compile OpenCV for Ras Pi
    - [ ] potentially buy the book

  * **Rust**
    - [ ] get to know the landscape of concurrency and where Rust fits in,
      Google search: [Rust
      concurrency](https://www.google.com.au/search?q=rust+concurrency)

  * **Ras Pi**
    - [ ] look at building a serverless cluster
      https://blog.alexellis.io/your-serverless-raspberry-pi-cluster/
    - [ ] Kafka on Ras pi Google Search: [Kafka ras pi](https://www.google.com.au/search?q=kafka+on+ras+pi)

  * **Recorder Music**
    - [ ] https://www.google.com.au/search?q=concerning+hobbits+recorder+notes&tbm=isch
    - [ ] https://www.google.com.au/search?q=my+heart+will+go+on+notes&tbm=isch
    - [ ] https://www.google.com.au/search?q=jurassic+park+notes&tbm=isch
    - [ ] https://www.google.com.au/search?q=recorder+duets+williamson&tbm=isch

  * **Ember**
    - [ ] look at static typing via [Typing your Ember in 4 parts](http://www.chriskrycho.com/2017/typing-your-ember-part-1.html)
      using https://github.com/typed-ember/ember-cli-typescript

  * **Diet**
    - [ ] zucchini noodles - https://downshiftology.com/how-to-make-and-cook-zucchini-noodles-the-most-popular-methods/
    - [ ] with one of these http://www.kitchenwarehouse.com.au/Zyliss-Julienne-Slicer-Orange
    - [ ] brussle sprouts - http://skinnymixers.com.au/skinnymixers-bacon-brussels-sprout/

  * **Keyboard**
    - [ ] track when the [Tex Yoda
      II](http://www.tomshardware.com/news/tex-yoda-ii-mechanical-keyboard-preorder,34924.html)
      will be available or build one myself based on something like
      [Arteus](http://atreus.technomancy.us/) the key being the IBM trackpoint.
    - [ ] read about the poker 3 https://medium.com/@MediaUnmasked/pok3r-poker-3-60-keyboard-review-32ee46fb27f2

  * **Hardware**
    - [ ] get an [Ahooga horn](https://www.google.com.au/search?q=ahooga+horn&oq=ahooga+horn)
    - [ ] look at https://codebender.cc/ to connect to arduino from chrome book?

  - [ ] look at learning norman keyboard layout
    and only fair to look at [Dvorak
    DSK](https://en.wikipedia.org/wiki/Dvorak_Simplified_Keyboard) as well
  - [ ] railway baseboard joining with pattern makers dowels http://www.stationroadbaseboards.co.uk/cart_dowels.htm
  - [ ] read [How NASA Got Apollo Astronauts Through the Dangerous Van Allen
    Belts](http://www.popularmechanics.com/space/moon-mars/a24678/nasa-van-allen-belts-explainer/)
  - [ ] buy some sugru https://sugru.com/

* Tue 10th
  * hash as a form of wrapper for a store with multiple keys key: [country, state, city, suburb], value: [data hash]
    play on denormalized storate of data
  * ansible but not immutable infrastructure as require IP's
  * initial commit around an iterator for many lines organised in pages (custom for_each iterator???? CSV in BE days?)

* Fri 6th

  7 databases, install extensions for postgresql
  ```
  psql book
  create extension fuzzystrmatch;
  create extension tablefunc;
  create extension dict_xsyn;
  create extension pg_trgm
  create extension cube;

  ls /usr/local/share/postgresql/extension/ | ag 'fuzzystrmatch|tablefunc|dict_xsyn|pg_trgm|cube'
  ```

  Look at
    - [ ] thumb reader in arduino
    - [ ] cut & paste via [PMD CPD duplicate code detection](https://pmd.github.io/pmd-5.8.1/usage/cpd-usage.html)
      3 algos
        1. first [Michael Wise’s Greedy String Tiling algorithm](http://www.onjava.com/pub/a/onjava/2003/03/12/pmd_cpd.html)
        2. next [Burrows-Wheeler transform](http://marknelson.us/1996/09/01/bwt/)
        3. current [Karp-Rabin](https://xlinux.nist.gov/dads/HTML/karpRabin.html)
    - [ ] alog behind optafinder
      related to [Tabu search](https://en.wikipedia.org/wiki/Tabu_search)
      as discussed in [A Decade of Optaplanner](https://www.optaplanner.org/blog/2016/08/07/ADecadeOfOptaPlanner.html)
    - [ ] ras pi control everything, incubate eggs, clothes dry, compost
    - [ ] ras pi scanner
