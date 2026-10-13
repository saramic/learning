# Progress October 2026

## Tue 13

### More for mmWave and sensing

[Andris Gauracs - Developer Advocate @ Better Stack LinkedIn post
](https://lnkd.in/p/gtpj2ncV)

> I built a sensor that guesses what I'm doing in my living room using only
> Wi-Fi signals. No camera involved.
> 
> The hardware is three ESP32-S3 boards at about $10 each, running RuView's
> open-source firmware. I changed it so the boards also listen to each other,
> not just the router, which turns 3 sensing lines across the room into 9.
> 
> To train it, my webcam acted as the teacher: a pose model in the browser
> labelled what I was doing while the boards recorded the Wi-Fi signal. Then a
> small model learned to predict those labels from the Wi-Fi data alone.
> 
> In a separate live test it hadn't seen before, it got 79.5% right across 8
> movements. Jumping and sitting were easy. Waving was hard (13%), because arms
> barely change the signal.
> 
> All the code is open source if you want to build your own

- [https://github.com/andrisgauracs/wifi-sensing-kit](
  https://github.com/andrisgauracs/wifi-sensing-kit)

### More Federadio

to add to federation what about phone to phone comms with something like

[Mizan Ali - full-stack on-chain & AI product engineer LinkedIn post
](https://lnkd.in/p/gK8i_uaF)

> AirDrop can send a file between two iPhones in the middle of nowhere. No
> Wi-Fi, no signal. It uses AWDL, Apple's peer-to-peer Wi-Fi link.
>
> You can use AWDL in your own app too, but there's a catch: Apple doesn't give
> you an API for it. 🤫
>
> You have to reach it through Network framework, using a flag most iOS devs
> have never touched: includePeerToPeer.
> Even then, you still have to build discovery, connection handling, framing,
> sort out what happens when both phones dial each other at once, and add
> encryption on top.
>
> We built all of that into the [Offline
> Protocol](https://github.com/Offline-Protocol/offline-protocol-sdk) SDK.
>
> The image shows what it looks like in React Native.
> Two iPhones, no router, no server, talking directly. 📡
>
> What you get out of the box:
> ⚡ AWDL and LAN over real TCP streams
> 🔵 Bluetooth LE mesh when phones are out of Wi-Fi range
> 🧠 Automatic transport switching for every message, with no changes to your
>    code
> 🔐 End-to-end encryption by default with MLS (RFC 9420)
> 🔁 Acks, retries and dedup built in
>
> The same JS API works on Android over Wi-Fi Direct and the local network, and
> a Python host on the same Wi-Fi can join in. The core is in Rust, with
> bindings for Swift, Kotlin, Python and React Native.
>
> And it's fully open source 👇
> [https://lnkd.in/dpy9ptD5](https://lnkd.in/dpy9ptD5)
>
> What would you build if your app didn't need the internet?

## Wed 7

### Justin Searls on retiring from programming

[Retiring from programming w/ Justin Searls](https://yagni.fm/episodes/retiring-from-programming-w-justin-searls)

* Code review is theater, and AI fixes that. Most human PRs get a drive-by
  glance and an "LGTM" — Justin's running an Opus review-loop that actually
  hunts until it finds nothing wrong, wave after wave.
* AI is the best teammate you'll ever have. Never tired, never has a bad day,
  never litigates a PR comment — he says the emotional-labor tax of managing
  people was half the job, and it's just gone.
* Framework/language conferences are on their way out. His take: communities
  should form around what's being built, not syntax — "there's no GCC
  conference," and Rails World should eventually just be for Rails core
  committers.
* Rails isn't dead, it's just not implementation anymore — well, maybe. One
  real disagreement in the episode: is Rails' lasting value the design ideas
  (hand an agent a markdown spec) or the hardened implementation (why reinvent
  a CRUD app when Rails already does 99% of it)? He argues the latter.
* "One person framework" just became literal. Rails' old tagline is now true in
  the most extreme sense — team size of one is the new ideal, which is
  liberating if you're a generalist and terrifying if you're a specialist.
* His own setup is the wildest part: 7 solo iOS/Mac/Vision apps, agents working
  unattended overnight (hourly cron wakes Claude, works GitHub issues, reviews
  itself, ships to TestFlight), and he's barely touching the chat window — just
  using the apps and filing bugs via screenshots.
* Career advice: stop being an order-taker, go find where the business makes
  money. For anyone employed now — get close to whoever owns outcomes and prove
  value with the tools. For new grads — go be the most tooled-up person at a
  normal company in a boring industry, not another SF startup.
* Dev jobs: short-term boom, long-term shrink. His analogy is
  auto-manufacturing automation — cheaper cars increased demand enough that
  auto employment actually rose for 10–20 years post-automation before
  eventually declining. He expects a similar near-term software hiring boom
  from pent-up demand, with the proportion of people working as full-time devs
  declining over a longer horizon.

## Mon 5

### Noise cancelling microphone array

what intruiged me most was the noise cancelling 4 microhpone array concept
[LinkedIn Nick Lothian](https://www.linkedin.com/posts/nicklothian_3ddesign-ai-chatgpt-ugcPost-7512706032192655360-MNS0)

> As a weekend side project I built EarWing: a hardware device for private
> transcription. 
> 
> It's all 3D printed, open source and completely private. It uses a ESP32 to
> perform beamforming noise cancellation using a 4 microphone array. It then
> offloads the audio to your browser where it uses NVidia's Parakeet
> transcription model running in the browser. It passes the transcription to a
> second in-browser LLM which summarises the conversation to produce notes,
> actions and open questions which gets displayed on the device. 
> 
> Everything (including the #3Ddesign ) was done using #AI in #ChatGPT and
> #Claude. 
> 
> You can just build things.
> 
> Link in the first comment!

- [https://github.com/nlothian/earwing](https://github.com/nlothian/earwing)


### Drones

[LinkedIn Dangel Rodriguez](https://www.linkedin.com/posts/seenfinity_were-entering-the-era-of-physical-agents-ugcPost-7512437499932307457-p9C0/)

> We’re entering the era of physical agents. In this simulation, GLM 5.3
> controls a drone through MAVLink and ArduPilot, navigating an industrial
> environment and making decisions in real time.
>
> Voight captures the entire execution: what the agent sees, what it decides,
> what it commands, and what actually happens.  Software agents were just the
> beginning.  Physical agents are next.
>
> It's open source: the MAVLink bridge, the agent and the 3D ground station:
> https://lnkd.in/eTVMUuVx -> [https://github.com/Voightxyz/mavlink-bridge](https://github.com/Voightxyz/mavlink-bridge)

### Camera righting

[LinkedIn Vladimir Ilyash](https://www.linkedin.com/posts/vilyash_computervision-opensource-ugcPost-7511196379218845696-ggJ_/)

> We've open-sourced RightWayUp, a model that estimates how far an image is
> rotated, at any angle through 360°.

- [https://cheqit.ortusai.io/resources/rightwayup](https://cheqit.ortusai.io/resources/rightwayup)
- [https://github.com/ortusaitech/rightwayup](https://github.com/ortusaitech/rightwayup)
- [https://huggingface.co/ortusai/rightwayup](https://huggingface.co/ortusai/rightwayup)


### Drone tracking cameras

[LinkedIn Peter Guld Leth](https://www.linkedin.com/posts/peterguldleth_counteruas-computervision-robotics-ugcPost-7510635727697764352-0XIt/)

> Real PTZ camera vs simulated drones at 29 fps 👀🚀 
> 
> "hawkeye" is the counter-drone camera controller I work on as part of my
> thesis. Here it drives a real AXIS Q6225-LE on the lab bench, while mira (our
> Rust + wgpu simulator) renders the sky, four drones, two clutter tracks and a
> deliberately bad radar.
> 
> The loop: the simulated radar (4 Hz, biased, noisy, with dropouts) cues a
> target. hawkeye tracks it with an IMM filter, slews the camera, zooms until
> the detections are confident, decides drone or clutter with a sequential
> test, then moves to the closest unverified track. Every command the simulated
> gimbal gets is mirrored to the real one over VAPIX.
> Bench numbers: ~29 fps closed loop, 0.01 to 0.5° between sim and real gimbal
> while tracking. On big slews it drifts to 1 to 6°, because the simulated
> gimbal accelerates harder than the Axis can.
> 
> What cost me time. A Windows port proxy between simulator and controller
> halved the loop to 14 fps (Nagle, most likely). The camera came back from a
> student project with its built-in autotracking switched on, so it chased
> people around the room and fought my controller for the motors. And the Axis
> has no deadman, so a crashed script leaves a camera that keeps on spinning 🫠
> 
> Limitation: the drones and radar are simulated, the mount is uncalibrated,
> and the camera is looking at a lab shelf. Real radar and real sky come next.

## Thu 1

### Auth
- via The Primagean, an Auth alternative to Clerk and used by bunch of AI companies
  - [https://workos.com/](https://workos.com/)

### RC flight

- **GPS Autopilot Shuttle Glider Dropped from Drone - RCTESTFLIGHT - rctestflight**
  [![
    GPS Autopilot Shuttle Glider Dropped from Drone - RCTESTFLIGHT - rctestflight
  ](http://i.ytimg.com/vi/YqQr4tHLKOo/hqdefault.jpg)](https://youtu.be/YqQr4tHLKOo)
  - using auto flight software to get a simple foam glider to autonomously come home
  - [Px4](https://px4.io/) open source autopilot
  - [ArduPilot](https://ardupilot.org/)
  - [DragonLink RC
    system](https://ardupilot.org/copter/docs/common-dragonlink-rc.html) 433Mhz
    RC system with telemetry - can exceed 50km
  - PinPointRC GSM based finder

- **Tiny Waypoint Drone! - 230g Autonomous Wing - rctestflight**
  [![
    Tiny Waypoint Drone! - 230g Autonomous Wing - rctestflight
  ](http://i.ytimg.com/vi/gXjGto5-AvA/hqdefault.jpg)](https://youtu.be/gXjGto5-AvA)
  - simple foam wing
  - long range autonomous
  - Parts list:
    - PixRacer R15
    - Dragonlink Nano Receiver 
    - 6g analog servos 
    - HGLRC 1407 3600KV Motor 
    - BLHeli 20A ESC
    - generic GPS 
    - RunCam Split Mini
    - TBS Unify video TX
    - HGLRC 1407 3600KV Motor 
    - BLHeli 20A ESC

- **RC Solar Plane Flight Duration Test - rctestflight**
  [![
    RC Solar Plane Flight Duration Test - rctestflight
  ](http://i.ytimg.com/vi/1OGrDvInUAY/hqdefault.jpg)](https://youtu.be/1OGrDvInUAY)
  
- **Hydrofoil R/C Airboat Build and Test - rctestflight**
  [![
    Hydrofoil R/C Airboat Build and Test - rctestflight
  ](http://i.ytimg.com/vi/TMuEZl5DlMs/hqdefault.jpg)](https://youtu.be/TMuEZl5DlMs)
  - using a control system with PCB mast sensors
    [PCB Hydrofoil Kit](https://www.rctestflight.com/store/p/pcb-hydrofoil-kit)

- **Distributed Propulsion Blown Wing STOL - Build and Test - rctestflight**
  [![
    Distributed Propulsion Blown Wing STOL - Build and Test - rctestflight
  ](http://i.ytimg.com/vi/hObWTCserzA/hqdefault.jpg)](https://youtu.be/hObWTCserzA)
  - lots of motors for super slow take off
  - lots of details on gluing with gorilla glue
  - lots of build ideas
  - overview of ardupilot etc

- **I Built the World's Biggest Hydrofoil Board - rctestflight**
  [![
    I Built the World's Biggest Hydrofoil Board - rctestflight
  ](http://i.ytimg.com/vi/cvZR1yca6KM/hqdefault.jpg)](https://youtu.be/cvZR1yca6KM)

- **Will It Foil? Building a R/C Hydrofoil Sailboat - rctestflight**
  [![
    Will It Foil? Building a R/C Hydrofoil Sailboat - rctestflight
  ](http://i.ytimg.com/vi/eIqha2AnhGY/hqdefault.jpg)](https://youtu.be/eIqha2AnhGY)


### AI game play

- [Jev AI Plays Minecraft, Subway Surfers, and Drives Cars: Demos
  Reviewed](https://www.mindstudio.ai/blog/jev-real-time-game-demos)

- **Computer Use is Solved? - The PrimeTime**
  [![
    Computer Use is Solved? - The PrimeTime
  ](http://i.ytimg.com/vi/BHPDsGVciDk/hqdefault.jpg)](https://youtu.be/BHPDsGVciDk)
  - system 1 thinking decisino bot

- **🚨🚨 TRYING JEV : The new STYLE of AI!!! 🚨🚨 - The PrimeTime**
  [![
    🚨🚨 TRYING JEV : The new STYLE of AI!!! 🚨🚨 - The PrimeTime
  ](http://i.ytimg.com/vi/FQNftquDDaI/hqdefault.jpg)](https://youtu.be/FQNftquDDaI)

### Code requirements

- [https://github.com/richardhp/brr-tools](https://github.com/richardhp/brr-tools)

Tag disparate code fragments across the repo and link them to the underlying
requirement.

**BRR** stands for **Business Requirement Records**. [Architecture Decision
Records](https://github.com/npryce/adr-tools) explain why a system is built the
way it is. BRRs record what the business asked for, and point at every piece of
code that delivers it.

example

```
// <NAVRNZR>
fn refund(order: &Order) -> Result<(), RefundError> {
    ...
}
// </NAVRNZR>
```

