---
layout: post
title:  "22 May 2024 - home lab and alacritty ideas 🐈"
date:   2024-05-22 12:30:00 +1000
categories: learning update terminal alacritty "home assistant"
---

## A bunch of IoT for Grow Tent

I got myself a grow tent for growing chillies 🌶️ and through some lapse of
focus I have managed to get myself into 3 different IoT home automation apps on
my Phone: **Arlec Grid Connect** (for an unrelated fan), **Meross** for a smart
switch and **Govee Home** for a thermometer/hygrometer. As I was keen to be
able to in future automate all the things, I was hoping to have it all in 1
app, so I vaguley thought that [home-assistant](https://www.home-assistant.io/)
was a thing at might be able to do this on my recently purchased [Dell
Optiplex](https://dimitrije.website/posts/2024-01-02-homelab-hardware.html)
home lab servers running [proxmox](https://www.proxmox.com/en/)? just maybe?

There are some home-assistant Meross integratinos

- [ ] [https://github.com/albertogeniola/meross-homeassistant
  ](https://github.com/albertogeniola/meross-homeassistant)
- [ ] [https://github.com/krahabb/meross_lan
  ](https://github.com/krahabb/meross_lan)

Proxmox on home-assistant tutorial

**How To Install Home Assistant On Proxmox 7 (Quick Tutorial) - The Tinker
Dad**

[![
How To Install Home Assistant On Proxmox 7 (Quick Tutorial) - The Tinker Dad
](
  http://img.youtube.com/vi/1Un4zJJWUTE/0.jpg
)](
    https://youtu.be/1Un4zJJWUTE
)

also tutorials from [@friendlyantz
](https://github.com/friendlyantz)

- [ ] [https://friendlyantz.me/proxmox/
  ](https://friendlyantz.me/proxmox/)
- [ ] [https://friendlyantz.me/home-assistant/#install-haos
  ](https://friendlyantz.me/home-assistant/#install-haos)

The idea of using zigbee also, came up. I do have some development modules but
obviously there are a bunch of these things available online. Even for future
when my son builds out his aquaponics he may find something like the below
handy

[https://www.aliexpress.com/item/1005006418111884.html
](https://www.aliexpress.com/item/1005006418111884.html)
Tuya ZigBee Intelligent Chlorin Meter 7 in 1 PH ORP EC Total Dissolved Solids
Salinity Temp CL Test Meter Swimming Pool Water ~$120

or

[https://www.aliexpress.com/item/1005004936390806.html
](https://www.aliexpress.com/item/1005004936390806.html)
Tuya WiFi 7in1 Water Quality Tester Water Analyzer
PH/ORP/EC/PPM/CF/Humidity/Temperature Monitor Water Quality Detector PH Meter
~$90

as well as soil temperature humidity sensors
[https://www.aliexpress.com/item/1005005388244280.html
](https://www.aliexpress.com/item/1005005388244280.html)
![](https://ae01.alicdn.com/kf/S5fc3798c65b94c748f725b403bffb53fW/Tuya-Smart-Zigbee-Soil-Tester-Temperature-and-Humidity-Meter-Waterproof-Thermohygrometer-Garden-Automation-Irrigation-Detector.jpg_.webp
){: width="480"}

DIY Automatic watering water pump Automatic irrigation module DIY set Soil
moisture detection automatic watering Pumping Diy Kit $30
[https://www.aliexpress.com/item/1005004729206953.html
](https://www.aliexpress.com/item/1005004729206953.html)
![](https://ae01.alicdn.com/kf/S1bffee11348646dcbf970ce455450168C/DIY-Automatic-watering-water-pump-Automatic-irrigation-module-DIY-set-Soil-moisture-detection-automatic-watering-Pumping.jpg_.webp
){: width="480"}

WIFI Intelligent Watering Device Double Pump Timed Automatic Drip Irrigation
System Remote APP Controller for Garden Terrace - ~ $45
[https://www.aliexpress.com/item/1005005951703537.html
](https://www.aliexpress.com/item/1005005951703537.html)
![](https://ae01.alicdn.com/kf/S84e06e0b57294886b5ed74dfea14a92do/WIFI-Intelligent-Watering-Device-Double-Pump-Timed-Automatic-Drip-Irrigation-System-Remote-APP-Controller-for-Garden.jpg_.webp
){: width="480"}


or

buy some probes and build your own
[https://www.aliexpress.com/item/1005006624710177.html
](https://www.aliexpress.com/item/1005006624710177.html)
![](https://ae01.alicdn.com/kf/Sc109d70f9c65477e847e53d24534dd3b3/DS18B20-Stainless-Steel-Package-1M-2M-3M-5M-Waterproof-18b20-Cable-Probe-Temperature-Sensor.png_.webp
){: width="480"}

There are also articles on integrating with
- [ ] govee lights [home-assisntant.io govee light
  integration](https://www.home-assistant.io/integrations/govee_light_local)
- [ ] govee hygrometers [govee ble thermometer hygrometer
  sensor](https://community.home-assistant.io/t/govee-ble-thermometer-hygrometer-sensor/166696/8)


for the fan I have, I could get a fan speed controller
- [TEMU: 1pc 50-220V 25A AC 2000W AC Motor Speed Controller Motor Speed
  Controller Adjustable Voltage
  ](https://www.temu.com/ul/kuiper/un9.html?goods_id=601099529534222&sku_id=17592273183999&adg_ctx=a-0d2f6d77~c-3dbb553c~f-8bd48016&_x_ads_sub_channel=shopping&_p_rfs=1&_x_ns_prz_type=-1&_x_ns_sku_id=17592273183999&mrk_rec=1&_x_ads_channel=google&_x_gmc_account=710728018&_x_login_type=Google&_x_ads_account=2720833615&_x_ads_set=20878039836&_x_ads_id=157413511615&_x_ads_creative_id=685403347863&_x_ns_source=g&_x_ns_gclid=Cj0KCQjwjLGyBhCYARIsAPqTz19dwDIG-LqFttvOIBXwwLLbhLvb8NH-0q5uaGu-J0WUpqbBNYg81wMaAg_iEALw_wcB&_x_ns_placement=&_x_ns_match_type=&_x_ns_ad_position=&_x_ns_product_id=710728018-17592273183999&_x_ns_target=&_x_ns_devicemodel=&_x_ns_wbraid=Cj8KCQjw6auyBhCOARIuAOmEv8Ou_GFfvYAMz9bP-9Rw31TRcQPNl-2zxXh913iZ0TD_9ENsN0-kg5e_NxoCnJI&_x_ns_gbraid=0AAAAAo4mICF09SnpABJqd8WxZ7_2SFc8t&_x_ns_targetid=pla-2322922636274)

  ![](https://img.kwcdn.com/product/open/2023-10-14/1697266245823-d51a0b44371141c28827812aa77a155e-goods.jpeg?imageView2/2/w/800/q/70/format/webp
  ){: width="480"}
- or build one
  [https://www.homemade-circuits.com/simple-ceiling-fan-regulator-circuit/
  ](https://www.homemade-circuits.com/simple-ceiling-fan-regulator-circuit/)
  - [ ] How To Make Simplest 220V AC Fan Speed Controller Circuit,100W bulb
    [![
      How To Make Simplest 220V AC Fan Speed Controller Circuit,100W bulb
      brightness controller, Regulator - AMKP40 technology
    ](
      http://img.youtube.com/vi/eVAF54NLxkw/0.jpg
    )](
        https://youtu.be/eVAF54NLxkw
    )
  - [ ] 7000 watt regulate, Perfect and Smoothly Working regulator for fan with
    volt meter - RJ EDIT ALL

    [![
        7000 watt regulate, Perfect and Smoothly Working regulator for fan with
        volt meter - RJ EDIT ALL
    ](
      http://img.youtube.com/vi/Nm7xf-VRSiM/0.jpg
    )](
        https://youtu.be/Nm7xf-VRSiM
    )

## Alacritty

vaguely interested in switching from iTerm2 to
[Alacritty](https://alacritty.org/) post DHH's positive experience with
alacritty and [tactile (A window tiling extension for GNOME
Shell)][https://gitlab.com/lundal/tactile] for aligning 

- https://x.com/dhh/status/1793032259525583345
- https://x.com/dhh/status/1793046135977742658

also a buch of people switching from iTerm2 to alacritty

- [ ] [How I migrated from iTerm to alacritty - Rahul Gupta (May 18,
  2020)](https://pezcoder.medium.com/how-i-migrated-from-iterm-to-alacritty-c50a04705f95)
- [ ] [Switched to Alacritty from iTerm2 on
  macOS!](https://www.reddit.com/r/unixporn/comments/umkcnz/aqua_switched_to_alacritty_from_iterm2_on_macos/)
- [ ] [Ditch iTerm for Alacritty and tmux - Cason Adams (27 Dec
  2021)](https://dev.to/casonadams/ditch-iterm-for-alacritty-and-tmux-5ane)
- [ ] [Rebuilding My iTerm setup in
  Alacritty](https://www.danielcorin.com/til/alacritty/rebuilding-my-iterm-setup-in-alacritty/)


## Random work stuff

### reduce space used by QuickTime videos

using ffmpeg

```sh
# to convert .mov to .mp4 files
ls | \
    grep mov | \
    awk -F".mov" '{print $1}' | \
    xargs -I {} ffmpeg -y -i {}.mov {}.mp4


# to convert AND to delete the old large .mov file
# note if the .mp4 conversion is corrupted, your file is lost
ls | \
    grep mov | \
    awk -F".mov" '{print $1}' | \
    xargs -I {} \
    bash -c "ffmpeg -y -i \"{}.mov\" \"{}.mp4\" && rm \"{}.mov\""
```

### can we build an AI?

- [ ] [
  https://azure.microsoft.com/en-au/products/ai-services/openai-service
  ](https://azure.microsoft.com/en-au/products/ai-services/openai-service)

### optimisation in scheduling

- this article [A Suduko Solving Serverless Endpoint Using WebAssembly and
  OR-Tools - Kjartan Rekdal Müller (Sep 1,
  2020)](https://medium.com/swlh/a-suduko-solving-serverless-endpoint-using-webassembly-and-or-tools-df9f7bb10044)
    - [ ] Google seems to have OR-Tools [https://developers.google.com/optimization](https://developers.google.com/optimization)
    - [ ] which may be available as WASM
      [https://github.com/kjartanm/wasm-or-tools](https://github.com/kjartanm/wasm-or-tools)
    - [ ] using the idea of [Constraint
      Programming](https://en.wikipedia.org/wiki/Constraint_programming)
    - final code
      [https://github.com/kjartanm/sudoku-solver](https://github.com/kjartanm/sudoku-solver)
- cam across this paper on Rust constraint programming
    - [ ] [Multithreaded Multiway Constraint Systems with Rust and WebAssembly
      Author: Rudi Blaha Svartveit Supervisor: Jaakko Järvi
      ](https://bora.uib.no/bora-xmlui/bitstream/handle/11250/2770614/masterthesis_svartveit.pdf?sequence=4&isAllowed=y)
    - [https://github.com/HotDrink](https://github.com/HotDrink)
    - [https://github.com/HotDrink/hotdrink-rs](https://github.com/HotDrink/hotdrink-rs)
- rust ga-scheduler create
    - [https://docs.rs/crate/ga-scheduler/latest](https://docs.rs/crate/ga-scheduler/latest)
- for some code writing/reading practice this basic tutorial may be worth checking out
    - [https://blog.appliedcomputing.io/p/writing-a-kubernetes-scheduler-in](https://blog.appliedcomputing.io/p/writing-a-kubernetes-scheduler-in)
- https://docs.rs/copper/latest/copper/# also mentions
    - [https://www.gecode.org/](https://www.gecode.org/)
    - [https://github.com/google/or-tools
      ](https://github.com/google/or-tools)
- OptaPlanner -> timefold.ai
    - [https://docs.timefold.ai/timefold-solver/latest/quickstart/overview
      ](https://docs.timefold.ai/timefold-solver/latest/quickstart/overview)
    - [https://news.ycombinator.com/item?id=24761714
      ](https://news.ycombinator.com/item?id=24761714)
- for vehichle routing there is
    - [https://github.com/reinterpretcat/vrp
      ](https://github.com/reinterpretcat/vrp)
- another hardcore solver for convex optimisations **Clarabel**
    - [https://www.reddit.com/r/rust/comments/12ymmh4/announcing_clarabel_interior_point_solver_for/
      ](https://www.reddit.com/r/rust/comments/12ymmh4/announcing_clarabel_interior_point_solver_for/)
    - [https://github.com/oxfordcontrol/Clarabel.rs](https://github.com/oxfordcontrol/Clarabel.rs)
    - [https://clarabel.org/stable/](https://clarabel.org/stable/)
- chronologic create [https://crates.io/crates/chronologic](https://crates.io/crates/chronologic)
- [simulated annealing wikipedia](https://en.wikipedia.org/wiki/Simulated_annealing)

- [https://github.com/topics/constraint-solver
  ](https://github.com/topics/constraint-solver)
    - [https://github.com/TimefoldAI/timefold-solver
      ](https://github.com/TimefoldAI/timefold-solver)
    - [https://github.com/dylanede/cassowary-rs
      ](https://github.com/dylanede/cassowary-rs)
        - [https://dylanede.github.io/cassowary-rs/cassowary/index.html
          ](https://dylanede.github.io/cassowary-rs/cassowary/index.html)
- [https://github.com/ptal/pcp
  ](https://github.com/ptal/pcp)
- [https://medium.com/@AlainChabrier/scheduling-with-constraint-programming-35a23839e25c
  ](https://medium.com/@AlainChabrier/scheduling-with-constraint-programming-35a23839e25c)

## Background job options

- discussing how to discard certain jobs
    - [https://edgeapi.rubyonrails.org/classes/ActiveJob/Exceptions/ClassMethods.html#method-i-discard_on](https://edgeapi.rubyonrails.org/classes/ActiveJob/Exceptions/ClassMethods.html#method-i-discard_on)
- and the fact that [Solid Queue will be default in rails
  8](https://github.com/rails/rails/issues/50442)
    - [Solid queue](https://github.com/rails/solid_queue)
- what other options are out there?
    - [https://www.reddit.com/r/rust/comments/8aql1z/robin_background_jobs_inspired_by_active_job_and/
    ](https://www.reddit.com/r/rust/comments/8aql1z/robin_background_jobs_inspired_by_active_job_and/)
    - [https://dev.to/leandronsp/building-a-dead-simple-background-job-in-rust-4m1d
    ](https://dev.to/leandronsp/building-a-dead-simple-background-job-in-rust-4m1d)
    - [https://medium.com/@simmibadhan/speed-up-rails-apis-with-background-jobs-553cc765cbbf
    ](https://medium.com/@simmibadhan/speed-up-rails-apis-with-background-jobs-553cc765cbbf)
    - [ ] [https://shopify.engineering/high-availability-background-jobs
    ](https://shopify.engineering/high-availability-background-jobs)
    - [ ] [https://www.linkedin.com/pulse/working-background-jobs-queues-ruby-rails-enhancing-amit-patel
    ](https://www.linkedin.com/pulse/working-background-jobs-queues-ruby-rails-enhancing-amit-patel)
    - [ ] [https://blog.appsignal.com/2023/09/20/an-introduction-to-sidekiq-for-ruby-on-rails.html
    ](https://blog.appsignal.com/2023/09/20/an-introduction-to-sidekiq-for-ruby-on-rails.html)
    - [ ] [https://elixirforum.com/t/replacing-rails-background-jobs-with-an-elixir-service/13336
    ](https://elixirforum.com/t/replacing-rails-background-jobs-with-an-elixir-service/13336)
    - [ ] [https://dev.to/kputra/rails-background-job-done-right-case-1-4ffi
    ](https://dev.to/kputra/rails-background-job-done-right-case-1-4ffi)
- which made me come across
    - [ ] [https://loco.rs/docs/the-app/workers/
    ](https://loco.rs/docs/the-app/workers/)
    - [ ] amd [https://loco.rs/blog/hello-world/
    ](https://loco.rs/blog/hello-world/)
    - [ ] a rewrite in rust [https://github.com/film42/sidekiq-rs
    ](https://github.com/film42/sidekiq-rs)

## Other code

- recent [https://melbjs.com/](https://melbjs.com/) (_which I did not attend_)
  had what looks like an an interesting presentation
    - Building a Guitar Tuner with JavaScript.
      [https://github.com/jasonaravanis/tuner
      ](https://github.com/jasonaravanis/tuner)
- a bunch of alternative terminal tools written in rust
    - [https://gist.github.com/sts10/daadbc2f403bdffad1b6d33aff016c0a
      ](https://gist.github.com/sts10/daadbc2f403bdffad1b6d33aff016c0a)
- rust powered cross shell prompt [https://starship.rs/](https://starship.rs/)

## Evented Simulator

- building my https://github.com/failure-driven/evented-fault-simulator
    - got me sidetracked onto pixel art to power some [PixiJS
      sprites](https://pixijs.com/8.x/playground)
- started with this tutorial using gimp

  How I use GIMP to Make Pixel Art Sprites and Spritesheets for Unity - AtoyK

  [![
    How I use GIMP to Make Pixel Art Sprites and Spritesheets for Unity - AtoyK
  ](
    http://img.youtube.com/vi/za0jE5k6ofk/0.jpg
  )](
    https://youtu.be/za0jE5k6ofk
  )
- which lead me to this next level tutorial
  The Ultimate Pixel Art Tutorial - Saultoons

  [![
    The Ultimate Pixel Art Tutorial - Saultoons
  ](
    http://img.youtube.com/vi/lfR7Qj04-UA/0.jpg
  )](
    https://youtu.be/lfR7Qj04-UA
  )
- and this full on channel [https://www.youtube.com/@AdamCYounis/videos
  ](https://www.youtube.com/@AdamCYounis/videos)
