# Progress September 2017

* Fri 29th

  A bit of a tab clean up and a number of things I have recently come across to practice and learn.
  - [ ] *RasPi*
    - [ ] *wifi*
      https://medium.com/a-swift-misadventure/setup-your-raspberry-pi-2-3-with-raspbian-headless-without-cables-c78309fd7045
      and https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md
      ```
      vi /etc/wpa_supplicant/wpa_supplicant.conf
      wpa_passphrase "<ssid text>" "<password text>"

      sudo wpa_cli reconfigure
      sudo wpa_cli -i wlan0

      sudo reboot

      ifconfig
      cat /etc/network/interfaces

      or run
      sudo wpa_supplicant -Dwext -iwlan0 -c/etc/wpa_supplicant/wpa_supplicant.conf

      # issue is that the wifi seems to drop out and never comes back?
      # should be running
      /sbin/wpa_supplicant -s -B -P /var/run/wpa_supplicant.wlan0.pid -i wlan0 -W -D nl80211,wext -c /etc/wpa_supplicant/wpa_supplicant.conf
      /sbin/wpa_cli -B -P /var/run/wpa_action.wlan0.pid -i wlan0 -p /var/run/wpa_supplicant -a /sbin/wpa_action
      # presumably via startup
      /etc/init.d/ifplugd
      ```
    - show packages
       ```
       apt-cache search keyword
       ```
    - [ ] *rust* programming
      - [ ] on ras pi
        https://hackernoon.com/compiling-rust-for-the-raspberry-pi-49fdcd7df658
        did not work with gcc particular architecture?
        ```
        curl https://sh.rustup.rs -sSf | sh
        rustup target add armv7-unknown-linux-gnueabihf
        sudo apt-get install gcc-4.7-multilib-arm-linux-gnueabihf
        cat >> ~/.cargo/config
        [target.armv7-unknown-linux-gnueabihf]
        linker = "arm-linux-gnueabihf-gcc-4.7"
        ^D

        cargo new hello-rpi --bin
        cd hello-rpi
        cargo build --target=armv7-unknown-linux-gnueabihf
        file target/armv7-unknown-linux-gnueabihf/debug/hello-rpi

        target/armv7-unknown-linux-gnueabihf/debug/hello-rpi: ELF 32-bit LSB  ... for GNU/Linux 2.6.32, 
        ```
        another part coming soon?

      - [ ] compile on Mac OSX down to RasPi
        https://blog.rust-lang.org/2016/05/13/rustup.html 
      - [ ] resin.io???
        https://docs.resin.io/raspberrypi/rust/getting-started/
        for some kind of web based creation of docker image that you write to SD card and run on RasPi?
      - [ ] tensor flow on RasPi using rust - https://medium.com/snips-ai/how-we-made-tensorflow-run-on-a-raspberry-pi-using-rust-7478f7a31329

    - Pi Filler to write SD cards on Mac OSX http://ivanx.com/raspberrypi/
    - [ ] connect from Mac OSX via serial interface
    ```
    screen /dev/tty.usbserial-AL00J9IS 115200

    but how to enlarge the default screen? and make mulit line work?
    http://aperiodic.net/screen/quick_reference some shortcuts
    ```
    screen # start
    screen -S <name>
    screen -ls # list running
    screen -x # attach to running
    screen -r <name> # ... by name
    screen -dRR # attach, detach elswhere or create

    C-a d # detach
    C-a D D # detach and logout
    C-a\ # exit all programs and screen - not recommended
    C-a C-\ # force-exit - not recommended

    C-a c     # create window
    C-a C-a   # jump between 2 windows
    C-a <number> # jump to 0-9 window
    C-a ' <number or titile> # jump to window
    C-a n or C-a <space> # next window
    C-a p or C-a <backspace> # previous window
    C-a " # show window list
    C-a w # show window bar if hidden

    C-a k # kill current windinw - not recommended
    C-a \ # kill all windows - not recommended
    C-a A # rename current window
    C-a S # split display horizontally
    C-a | C-a V # split display vertically
    C-a tab # jump to next display region
    C-a X # remove current region
    C-a Q # remove all regions but the current one

    C-a [ | C-a <esc> # freely navigate buffer
      C-a ]           # paste
      C-u             # half page up
      C-d             # half page down
      C-b             # back
      C-f             # forward
      h/j/k/l         # cursor left/down/up/right

    C-a ? # See help

    screen -S <name> -X <command> # send a command to a named session
      screen -S <name> -X screen ping example.com

    eg
      screen -S <name> [-p <page>] -X stuff $'quit\r'
      A full example:
      # run bash within screen
      screen -AmdS bash_shell bash
      # run top within that bash session
      screen -S bash_shell -p 0 -X stuff $'top\r'

    C-a C-l # redraw window
    C-a M # monitor window for activity
    C-a _ # monitor window for silence
    C-a C-v # enter digraph (for producing non-ASCII characters)
    C-a x # lock (password protect) session
    C-a : # enter screen command
    C-a H # enable logging in the screen session
      ```

  - [ ] * Ruby include* a better understanding in particular how to include
    standard rails view helpers in other things like PDF generation in mailers
    where `include MyHelper` does not work
    but `ActionView::Base.include MyHelper` does
  - [ ] *Hierarchy problem*
    - [ ] the RDBMs approach to the multi tierd problem of applying a trait to a
      hierarchy of actors. Say Company -> Department -> Team -> Employee and
      each can have a different pay rate but only at one level and then they
      filter down.
    - [ ] the above problem but with a denormalized look up specific view
  - [ ] *Sidekiq*
    - basic [API](https://github.com/mperham/sidekiq/wiki/API)
      ```
      Sidekiq::Queue.all                        # list queues
      Sidekiq::Queue.new("mailer")              # a particular queue
      Sidekiq::Queue.new("mailer").clear        # clear it

      # pop a job and requeue it
      job = Sidekiq::Queue.new("mailer").first
      job.delete
      msg = Sidekiq.load_json(job.item.to_json)
      Sidekiq::Client.push(msg)

      Sidekiq::Queue.new("mailer")              # size
      ```
      also
      * how to really requeue it
      * how it works with current application
      * how to repeat it a number of retries
      * read all the GitHub docs
    - [ ] [how to handle errors](https://github.com/mperham/sidekiq/wiki/Error-Handling) and [YouTube](https://www.youtube.com/watch?v=dGpbYqP5lr8&list=PLjeHh2LSCFrWGT5uVjUuFKAcrcj5kSai1&index=2)
      also all the other videos there
    - [ ] come up with my own "dojo" around sidekiq
    - [ ] other mentions
      - [ ] [LJ sidekiq](http://www.linuxjournal.com/content/sidekiq)
      - [ ] [sidekiq as microservice messaging queu](http://brandonhilkert.com/blog/sidekiq-as-a-microservice-message-queue/)
      - [ ] [Sitepoint sidekiq start](https://www.sitepoint.com/comparing-background-processing-libraries-sidekiq/)
      - [ ] https://mensfeld.pl/2016/10/enforcing-unique-jobs-in-karafka-and-sidekiq-for-single-resources/
      - try
        ```
        require 'sidekiq/testing'
        Sidekiq::Testing.inline!
        ```
        for immediate action
      - [ ] https://www.netguru.co/tips/things-to-remember-when-working-with-sidekiq
      - [ ] [Sidekiq queuing patterns](http://erik.debill.org/2016/08/07/sidekiq-queueing-patterns)
      - [ ] [tips on sidekiq queues](https://philsturgeon.uk/2016/11/16/tips-on-sidekiq-queues/)
      - [ ] https://medium.com/appaloosa-store-engineering/make-a-failing-sidekiq-worker-call-a-method-after-a-specific-number-of-retries-709d7f2cb9f3
      - [ ] http://blog.statuspage.io/kicking-ass-with-sidekiq
      - [ ] get web working
      - [ ] https://blog.codeship.com/improving-rails-performance-better-background-jobs/
      - [ ] try on ras pi
      - [ ] try on heroku
      - [ ] control directly via redis
    - *ansible*
      - [ ] for mac setup
      - [ ] for raspi setup
    - [ ] torrent http://www.utorrent.com/ - add to ansible/setup scripts
      - how about https://www.resilio.com/ (formerly bit torrent synch)
      - [ ] how about write my own

    - [burp suite](https://portswigger.net/burp/freedownload) for HTTP debugging
      - also charles
      - and fiddler
      - and TinyProxy? can it be setup
      - what about plain old Nginx or Rack?

* Tue 5th
    - [ ] look at ansible to build out environment
    - [ ] start on 7 DB stuff again
    - [ ] commit version 1 of image search
    - [ ] got some gizmos today that I need to play with:
        - [ ] tilt and pan servo arrangement
        - [ ] bluetooth wireless module to work with arduino
        - [ ] arduino compatable 3-axis accelerometer
        - [ ] Relay module
        - which will now go into a box along with modules like: lazers, ultrasonic transducers, neo pixels
          sense hat etc.

* Mon 4th
  - vim updates using FZF and Plug
    - [ ] look at linuxbrew? http://linuxbrew.sh/

* Sun 3rd
  NOTHING

* Sat 2nd
  - letter diamond dojo
    quick dojo for letter diamonds

    as per discussion in blog
      http://alistair.cockburn.us/Thinking+before+programming
    which suggests that blind TDD with this problem is
    not possible? I disagree

    also started with discussion on rules of 3
      https://erikbern.com/2017/08/29/the-software-engineering-rule-of-3.html

* Fri 1st
  - **setup chromebook dev**
  - using AWS micro and Termius app to ssh in
  - following https://github.com/bvmake/WhosGotWhat/wiki/Installing-Rails-on-free-Amazon-EC2-Micro
  - stuck on
    - installing rbenv
    - installing neovim https://github.com/neovim/neovim/wiki/Installing-Neovim
    - neovim builid ? https://copr.fedorainfracloud.org/coprs/dperson/neovim/
  - loosely following guides from
    - http://www.eq8.eu/blogs/18-chromebook-for-web-developers
    - http://dph.am/blog/2014/04/08/chromebook-for-developers/
    - what exactly is free on AWS? not [EC2](https://aws.amazon.com/free/)
  - yet to try
    - https://www.koding.com/teams/create/
  - lots of options at https://www.reddit.com/r/chromeos/comments/3yc7wy/can_one_do_programming_on_chromeos/
  - could re-install
    - to [make chromebook a clojurebook](http://www.clojuregeek.com/2015/07/15/turning-a-chrome-book-into-a-clojure-book)
