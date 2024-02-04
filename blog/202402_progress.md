# Progress Feb 2024

## Sun 4th Feb

**Mestastic**

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
