# Progress Feb 2024

## The 27th Feb

- watched

  RailsConf 2017: The Arcane Art of Error
  Handling by Brad Urani

  [![
    RailsConf 2017: The Arcane Art of Error
  Handling by Brad Urani
  ](
    http://img.youtube.com/vi/9R4wlyWBP1k/0.jpg
  )](https://youtu.be/9R4wlyWBP1k)
  - some comparison of Go mandatory error
    handling, Elixir's slightly nicer
    pattern matching and Ruby having errors
    magically propogate up
  - how to add metadata and data along the
    call stack

## Fri 23rd Feb

- did the talk at RORO about serving from home
    - would be good to add the onion routing stuff via RasPi
    - also more from solar hosting - https://scott.ee/project/solar-hosting-raspberry-pi/
    - https://scott.ee/project/rss/
    - https://scott.ee/project/the-perfect-pi/
    - https://scott.ee/project/self-hosting-the-fediverse/
    - **Where is Fediverse at**
      - https://gitlab.com/experimentslabs/federails
      - https://github.com/johnholdun/activitypub-server
      - https://www.w3.org/TR/activitypub/#Overview
      - https://blog.joinmastodon.org/2018/06/how-to-implement-a-basic-activitypub-server/

- using Ollama?
    - code from NDC for smart address parsing https://twitter.com/larsklint/status/1758263459035398383/photo/1
    - the preview is out
        - https://ollama.com/blog/windows-preview
    - and mistral is the model to get
        - https://ollama.com/search?q=mistral&p=1

    - also switch to the brew version?
        - https://formulae.brew.sh/formula/ollama
        ```sh
        brew install ollama
        ```

Building an RC blimp? - using a normal (air not hydrogen balloon) and a tear
down of a cheap remote control car
- https://www.instructables.com/13-RC-Blimp/
- started writing down some learning son Ham radio at https://saramic.github.io/ham-radio/
- is it time to look at Drools and OptaPlanner again?
    - https://www.optaplanner.org
    - https://docs.drools.org/5.2.0.M2/drools-planner-docs/html_single/
    - an actual simple blog?
        - https://medium.com/@prachi.khanna/understand-drools-with-simple-examples-dee5df58b512
    - https://docs.drools.org/6.3.0.Beta1/drools-docs/html/ch20.html

## Fri 9th Feb

**Can I host a rails app from a home server?**
- https://github.com/rubyaustralia/melbourne-ruby/issues/226
- there are a bunch of PaaS and Cloud options
    1. heroku
    2. fly.io
    3. render
    4. hatchbox
    5. DigitalOcean App Platform/DigitalOcean Droplet
    6. Engine Yard
    7. Cloud66
    8. [AWS AppRunner](https://aws.amazon.com/apprunner/) (runs on AWS Fargate?)
    - above list via https://www.reddit.com/r/rails/comments/144to6q/most_reliable_paas_for_rails_apps/
- what if you had something super custom at home
    - like true randomness
        - https://www.random.org/
        - https://blog.cloudflare.com/randomness-101-lavarand-in-production
        - or you build your own Quantum Computer Randomnumber Generator (QCRG)
            - https://github.com/openqbit-diy/MiniQRNG
            - https://medium.com/@OpenQbit/create-a-mini-qrng-quantum-random-number-generator-to-mobile-phones-at-home-2ecad591ce49
            - actual circuit and code details
                - https://community.blynk.cc/t/qrng-quantum-random-number-generator/47152
                - and more https://seqre.net/qrng
        - maybe your users want actual dice rolls to dictate their game
            - http://gamesbyemail.com/news/diceomatic
- here is a reason not to
    - https://darknetdiaries.com/transcript/86/#:~:text=Hm%2C%20it%20seemed,way%20into%20LinkedIn

    > But he looked at where the site was hosted and it was hosted on a
    > residential IP address.  Hm, it seemed like this LinkedIn site
    > reliability engineer was [00:05:00] running a web server out of his
    > house.  This means there are open ports from the internet into his
    > computers.  The hacker thought well, hm, if I can get into this
    > engineer’s home computer, this might give me a way into LinkedIn.
- is your internet redundant enough?
    - https://ghuntley.com/internet/
- can self host
    - https://scott.ee/project/self-hosting-the-fediverse/
    - via cloudflare tunnels - https://www.cloudflare.com/en-gb/products/tunnel/
- more about hosting on a Ras Pi5
    - https://twitter.com/dhh/status/1755600973492564067
    > @dhh
    > Oh it’s coming. Physical distribution of self-hosted systems are a great
    > idea. But we can do more than just ship you the media, we can send you
    > the whole computer! (Pi 5s run Campfire great!)
    https://twitter.com/dhh/status/1753436194753704313
    > @dhh
    > Don't let anyone tell you that it's too hard or too scary to run a
    > server on the internet. It's never been easier or safer.  You don't need
    > a vendor.
- Ravenstine/how_to_host_a_rails_app_on_a_home_server.md
    - https://gist.github.com/Ravenstine/d9210663c36b7949740c
- Talos linux for kubernetes - https://www.talos.dev/ is this related?

**Electroncis**
    - scope
        - https://www.bitscope.com/product/BS05/
        - discussed in minimal workbench
            - https://www.siliconchip.com.au/Issue/2021/February
    - **BK1198** radio chip
        - out of stock at Jaycar - https://www.jaycar.com.au/smd-ic-bk1198-radio-receiver/p/ZK8829
        - have an intersting history of radio data sheet
            - https://www.jaycar.com.au/medias/sys_master/images/images/10130064539678/ZK8829-dataSheetMain.pdf
        - do have a radio using the chip in stock
            - https://www.jaycar.com.au/digitech-portable-am-fm-transistor-radio/p/AR1458
        - used in Silicon Chip Firmware for the AM/FM/SW Single-Chip Digital Radio Jan 2021
            - https://www.siliconchip.com.au/Shop/6/5745
        - still available on AliExpress
        - experimenting article with YouTube links https://vk3ye.com/projects/projbk1198.htm


## Thu 8th Feb

**Bat Signal**
_work IoT hack project_
    - [ ] read how BlueTooth to Arduion connect works in
      https://github.com/meshtastic/web
    - [ ] read how multi screen and Bluetooth setup works in Arduion/ESP32
      https://github.com/meshtastic/firmware
    - to get
        - https://flasher.meshtastic.org/
    - working do you need https://github.com/WCHSoftGroup/ch34xser_macos as per
      https://meshtastic.org/docs/getting-started/serial-drivers/esp32/
    - [ ] need to take a look at how the keep alive in the client works
        - https://github.com/nicovak/mqtt.rails/blob/master/lib/mqtt_rails/client.rb
    - post yesterday's construction of an acrylic ESP32 and OLED display on top
      of monitor stand
        - need better acrylic cutting and forming tool setup
            - maybe gloves and gas burner may be enough?
              https://www.youtube.com/watch?v=s5nP7MDf63Y
            - [ ] https://www.youtube.com/watch?v=VAi879kLA34
                - mainly set things up, if jigsawing use water to cool and get
                  a proper heat gun
                  - https://www.bunnings.com.au/ozito-2000w-variable-temperature-heat-gun_p6290265
        - need a mini drill for mounting
            - get my mini drill sorted
            - get a pin vice to use as a drill
                - https://www.altronics.com.au/p/t2335-stainless-steel-pin-vice/
            - get a minature chuck for a drill
                - https://www.altronics.com.au/p/t2305-3mm-1.8-inch-chuck-pc-drill/
            - get specifc drill bits
                - https://www.altronics.com.au/p/t2323a-1.5-x-38mm-pcb-drill-bit/
        - need a breadboard and socket mounting mechanism for ESP32 with holes
          too small to mount

**Ham Radio**
    - interesting low cost rigs https://www.qrp-labs.com/
        - like https://www.qrp-labs.com/qmx.html
    - sBITX sounds interesting https://www.hfsignals.com/index.php/sbitx-v3/
    - by https://github.com/afarhan
    - maybe a first radio of choice - https://baofengtech.com/product/uv82/
    - get a license
        - https://www.acma.gov.au/amateur-radio-licences
    - club
        - https://vk3fsk.org.au/
            - Wed 8pm NET

**Electronics**
    - [ ] on arduino current measurement https://dronebotworkshop.com/dc-volt-current/
    - read up more SiliconChip
        - photography Oct 2023
        - 2M test signal Oct 2023
        - ras pi clock Jan-Feb 2024
        - Q meter for inductors Jan 2023
        - June basic RF signal generation Jun 2023
        - GPS sync clock Sep 2022 + kit
        - Jan 2021 SW digital radio

## Sun 4th Feb

**Meshtastic**

- LoRa TTGO T-Bea ESP32 development board
    - purchase and pinout https://mktechnic.com/product/esp32-tbeam-v1-1-f433/
    - pinout https://www.hackster.io/news/the-ttgo-t-beam-an-esp32-lora-board-d44b08f18628
    - purchase https://sunhokey.en.made-in-china.com/product/hwbTDpFEnkci/China-Ttgo-Meshtastic-T-Beam-V1-1-Esp32-433-868-915-923MHz-WiFi-BLE-Lora-Esp32-GPS-Neo-6m-SMA-18650-Battery-Holder-with-OLED.html
    - forum, maybe? https://meshtastic.discourse.group/t/t-beam-ttgo-v1-1-oled-not-working/5762
- existing T-Beams come with **SoftRF** installed
    - https://github.com/lyusupov/SoftRF/tree/master/software/firmware
    - on netowrk `open http://192.168.1.1`
    - https://github.com/lyusupov/SoftRF/blob/master/software/app/Emulator/README.md
    - user/password: SoftRF-XXXXXX/12345678
    - found this out whilst trying to debug why the Serial Monitor does not
      seem to work on Arduino IDE and returns gibberish
      - https://www.thethingsnetwork.org/forum/t/lilygo-ttgo-t-motion-no-serial-output-no-ttn-packets/38482/30

**Electronics**

- Inspired by this article about the workbench of MANUEL RABADE, Engineering
  Manager, Mexico City
  https://diyodemag.com/features/electronics_workbench_wonders_manuel_rabade
    - https://twitter.com/manuelrabade
    - recommends this book
      https://www.amazon.com.au/Forrest-Mims-Engineers-Notebook-M/dp/1878707035
    - and Bus Pirate - https://core-electronics.com.au/bus-pirate-v3-6a.html
    - also finds Oscilliscope not that often required and wants to get into
      ICSP and JTAG debuggers?
    - biggest Repo on sismic monoitor for Mexico
        - https://github.com/manuel-rabade/sismo_alerta
        - charging - https://www.sparkfun.com/products/15217
        - used the weather band receiver (retired) https://www.sparkfun.com/products/retired/11129
    - some interesting projects
        - https://diyodemag.com/projects/ez_atx_arduino_workbench_power_supply_part_1
        - https://diyodemag.com/projects/arduino_magnetometer_gps_compass_without_smartphone
        - 8bitCade XL gaming console
          https://diyodemag.com/columns/going_pro_8bitcade_xl_diy_retro_game_console
        - linuxConfAU 2021 swag badge
          https://diyodemag.com/columns/swagbadge_dagbadge_badge_ohmc_linux_conference
        - https://diyodemag.com/projects/build_your_own_raspberry_pi_powered_diy_night_vision_goggles_nvg
        - https://diyodemag.com/projects/esp8266_port_expansion_techniques_cd4051_arduino_pro_mini
        - [ ] on displays
          https://diyodemag.com/projects/seriali_parallel_graphics_screens_displays_using_arduino_wemos
        - slinky seismometer
          https://diyodemag.com/projects/arduino_uno_based_diy_earthquake_digital_seismometer
        - [ ] 433Mhz modules
          https://diyodemag.com/projects/mega_hertz_using_underrated_433mhz_modules_arduino_uno
        - https://diyodemag.com/projects/iot_irrigation_esp8266-based_garden_watering_controller
        - https://diyodemag.com/projects/kids_basics_ne555_lm311_automated_foghorn_sound_generator
        - https://diyodemag.com/projects/arduino_attiny3224_variable_power_supply_spoofer_using_usb_power_bank
        - https://diyodemag.com/projects/positioning_stepper_motors_arduino_uno
        - https://diyodemag.com/projects/airtag_hacking_flutter
        - https://diyodemag.com/projects/12_christmas_breadboard_ne555_lm311_4017_electronics_projects_for_kids_part_2
          - [ ] reminds me I should look at 555 book
        - https://diyodemag.com/columns/going_pro_tiny_yet_mighty
           - [ ] $105AUD https://shop.pokitmeter.com/en-au/products/pokitmeter
        - https://diyodemag.com/columns/going_pro_two-wheel_assist

## Thu 1st

**ActivityPub**

- ActivityPub is the underlying protocol of the fediverse and things like mastadon
- so how does it work and how can you fedirates some data between some servers?
- there is the spec
    - https://www.w3.org/TR/activitypub/#Overview
- looking online at a forum
    - https://socialhub.activitypub.rocks/t/any-tools-and-tutorials-on-rails-and-activitypub/449/23
    - shows this example https://blog.joinmastodon.org/2018/06/how-to-implement-a-basic-activitypub-server/
    - as well as a bunch of other links including
        - https://github.com/johnholdun/activitypub-server - 6 years ago
        - https://rubygems.org/gems/activitypub-rails/versions/0.1.0
            - https://www.rubydoc.info/gems/activitypub-rails/0.1.0
            - https://gitlab.com/prismosuite/activitypub-rails - **404**
        - https://my.diffend.io/gems/social_web-activity_pub/0.1
            - https://gitlab.com/experimentslabs/experimentations/rails-activitypub-server **1 year ago**
            - https://gitlab.com/experimentslabs/federails - **2 weeks ago**
    - also a self hosting fediverse
        - https://scott.ee/project/self-hosting-the-fediverse/
        - has a bunch of stuff for hosting from home
            - via https://www.cloudflare.com/en-gb/products/tunnel/
            - and on a pi https://scott.ee/project/the-perfect-pi/
            - powered by solar? https://scott.ee/project/solar-hosting-raspberry-pi/
            - also RSS? https://scott.ee/project/rss/
