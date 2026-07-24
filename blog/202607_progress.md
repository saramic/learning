# Progress July 2026

## Fri 24 Jul

### On procrastination

saw an instagram advert for Liven

**Working with a deadline-dependent brain**

This is a really common pattern, and honestly your element14 challenges are a
good clue about what already works for you — external deadlines with public
visibility (forum posts, judging dates) seem to get you moving on hardware
projects. Health, house, and general work chores don't have that built-in
structure, so they slip. The fix isn't more willpower, it's borrowing the
mechanism that already works and applying it deliberately elsewhere:

Manufacture external deadlines and stakes. Tell someone specific ("I'll send
you the updated will/insurance doc by Friday") rather than just deciding
internally. Internal deadlines don't trigger the same urgency response — a
real other person, even for something small, does.
- **Body doubling / scheduled co-working**. Some apps and communities are
  built entirely around this (there's a whole "WorkMode"-style category — 1:1
  video sessions where someone just watches you work). You don't need
  software for it though — a standing "admin hour" with your wife, a scout
  leader, or a colleague works the same way.
- **Shrink the task until starting is trivial**. Deadline-brain isn't lazy,
  it's bad at starting things with no urgency signal. "Book the GP
  appointment" beats "sort out my health" — make the next action so small
  there's nothing to decide.
- **Attach a real clock, even artificially**. A visible countdown timer
  (Pomodoro-style) partially fakes the deadline-pressure response your brain
  responds to. Some apps like Forest make this visual and gamified if that
  helps you.
- **Use existing recurring events as anchors**. You already do this with
  scouting (camps, złazy) — the trick is deliberately hooking house/health
  tasks onto something with a fixed date, rather than leaving them float-y
  and "someday."
- **Recognise the pattern without moralising it**. This isn't a character
  flaw, it's how a lot of people's motivation system is wired — urgency and
  stakes activate it, calm open-ended time doesn't. Fighting that with guilt
  tends to make it worse.

On the specific app: Liven turns focus into something visible and tangible,
using CBT-based practices and daily self-reflection tools rather than pure
output pressure, with mood tracking as the core feature, an AI companion for
reflective conversations, short courses on procrastination and stress, and a
routine builder. Worth knowing: the AI companion (Livie) is now a paid add-on
as of 2026, and the pricing has shifted from what most reviews still quote,
and it works best for gentle daily mood logging rather than as a structured
anti-procrastination system — dedicated habit apps are more structured for
heavy procrastinators. There's also at least one critical review calling the
specific "stop procrastination" plan not very useful and flagging
subscription cancellation friction — worth a skim before you commit money to
it. Given what actually works for you already (deadlines + visibility + a
community watching), I'd guess a body-doubling or accountability approach
will outperform a mood-tracking app. 

**Next Moves**

Given everything else in your life is engineered systems, I'd resist the urge
to build an elaborate new system here — that itself becomes a form of the
same procrastination pattern (tinkering with the tool instead of doing the
thing). Here's what I'd actually pick, in order of leverage:

1. Bring back the diary, but change the cadence, not the content.
Yearly was too sparse to matter — you'd write goals in January and by March
they'd fallen out of working memory entirely. Weekly is the sweet spot: short
enough to actually happen, frequent enough to catch drift before a year's
gone. Keep gratitude in it (it's good for you and costs 30 seconds) but don't
confuse it with your task-tracking system — one is for wellbeing, the other
is for getting things done, and mixing them tends to mean the doing-list gets
buried under reflection.

2. Handwritten vs Obsidian — use both, for different jobs.
Handwriting is better for the reflective stuff (gratitude, "how did this week
actually go") because the slowness is the point — it forces you to actually
think rather than dump. But for goal/task tracking, Obsidian wins for you
specifically: you already think in linked, structured, markdown-shaped
systems (Confluence, MusicXML, ADRs). You could link a weekly note to the
relevant project note (VapeCell, house, health), use the Tasks or Kanban
plugin for a visible board, and use Dataview to auto-roll up "what's overdue"
— which matters a lot for someone whose brain needs visible urgency, not
buried-in-a-notebook urgency.

3. Pomodoro-style clock — yes, but as a starting tool, not the whole system.
Your issue isn't sustaining focus once you're in flow (you clearly can, given
the el14 build logs) — it's starting things with no external pressure. A
visible countdown timer is good exactly for that moment: "just 25 minutes on
the insurance renewal" removes the open-endedness that makes low-urgency
tasks feel infinite and avoidable. I'd make it a physical timer on your desk
rather than a phone app — physical and visible does more work than one more
notification source.

4. Daily/weekly/monthly/goal visibility — this is the right instinct, keep it
   minimal.
Something like:

Today: max 3 things, physically visible (whiteboard, sticky note — not buried in an app)
- This week: the Obsidian weekly note, reviewed every Sunday
- This month: one line, one target per domain (health / house / work /
  electronics) — four lines, not a project plan
- The goal: one sentence, stuck somewhere you actually look (fridge, monitor
  bezel)

The trap for an engineer's brain is making this too granular. Four domains,
one line each, reviewed weekly — resist adding sub-tasks until the habit
itself is solid.

5. Reporting to family — this is probably your single highest-leverage move.
It's the exact mechanism that already works for you in el14 (forum deadlines, public build logs) and scouting (people watching, expecting output). A five-minute Sunday check-in — "here's what I said last week, here's what happened, here's next week" — manufactures the social stakes your brain responds to, without needing an app at all. Doesn't need to be formal; even just saying it out loud at dinner works, because the accountability is the mechanism, not the format.

If I had to pick just one thing to start this week: the Sunday family
check-in + a visible weekly note. Everything else (Pomodoro, Obsidian
dashboards, daily sticky notes) is worth adding, but only once that weekly
rhythm is actually sticking — otherwise you're solving the wrong bottleneck
first.

Want me to draft an actual Obsidian weekly-note template (with the
four-domain structure and a simple linked goal-tracker) you could drop
straight into your vault?

### Airborne GPS mode

[https://www.instagram.com/p/DaK976wtdKy?hl=en](
https://www.instagram.com/p/DaK976wtdKy?hl=en)

coming soon??? [https://github.com/lorenzoferrozzi/pico-balloon-aprs](
 https://github.com/lorenzoferrozzi/pico-balloon-aprs)

- open APRS tracking site?
  - [https://aprs.fi/](https://aprs.fi/)

seems searching for "ubx command enalges Airborne" gives you a fiar overview
- using a ublox [NEO-M9N-00B](https://www.digikey.com.au/en/products/detail/u-blox/NEO-M9N-00B/12149174)
and as per
- [https://portal.u-blox.com/s/question/0D52p00009AaEleCAF/-gps-setting-querying-settings-for-airborne-mode](
  https://portal.u-blox.com/s/question/0D52p00009AaEleCAF/-gps-setting-querying-settings-for-airborne-mode)
  
  `b5 62 06 8a 09 00 00 01 00 00 21 00 11 20 06 f2 4f`
  - [https://github.com/cturvey/RandomNinjaChef/tree/main/uBloxM10OTPCodes](
    https://github.com/cturvey/RandomNinjaChef/tree/main/uBloxM10OTPCodes)

  - upload with [https://learn.sparkfun.com/tutorials/getting-started-with-u-center-for-u-blox/all](
    https://learn.sparkfun.com/tutorials/getting-started-with-u-center-for-u-blox/all)

### Sintillation Spectrometer vs Geiger counter

Post instagram advert for https://www.radiacode.com/

**RadiaCode — how it beats a Geiger counter, and DIY equivalents**

RadiaCode isn't a Geiger counter at all — it's a scintillation spectrometer.
It uses a CsI(Tl) scintillator crystal working together with a silicon
photomultiplier (SiPM) and adaptive processing of incoming data. The physics:
a gamma photon hits the crystal, which emits light, and that light is
collected by the SiPM/photodiode and converted into an electrical pulse whose
height is proportional to the photon's energy. 

That's the key difference from a Geiger-Müller tube: a Geiger tube just
counts ionisation events — it tells you "something happened," with no energy
info. A scintillator + SiPM gives you the energy of every photon, so instead
of just a count rate you get a full spectrum — letting you actually identify
which isotope you're looking at, like Potassium-40 vs Cesium-137, rather than
just "radiation went up." That's also part of why it feels faster/more
responsive — it's not waiting on tube dead-time statistics, it's
event-by-event energy discrimination. 

Energy resolution (how cleanly it separates nearby spectral lines) is limited
by things like statistical fluctuations in scintillation photon count per
event, imperfect optical coupling between crystal and photodetector,
electronic noise, and the fact that CsI(Tl) has a longer decay time and lower
light yield than premium scintillators like LaBr3 — which is why RadiaCode is
"good hobbyist grade," not lab grade. 

**For a DIY build**, this is a well-trodden hobbyist path and very much in
your wheelhouse given the VapeCell/electronics work:

- **Best documented open-source route:** the Open Gamma Detector project — a
  hackable DIY gamma-ray spectrometer using a NaI(Tl) scintillator, a SiPM,
  and a Raspberry Pi Pico, roughly $200 all-in for parts, no high voltage
  needed since SiPMs run at 27.5–33.8V instead of the ~1000V a PMT needs,
  with up to 7% energy resolution at 662 keV. This gives you a real board
  design + firmware rather than reinventing the analog front end. 
  - [https://github.com/OpenGammaProject/Open-Gamma-Detector](
    https://github.com/OpenGammaProject/Open-Gamma-Detector)
  - [https://opendosimeter.org/](https://opendosimeter.org/)
- **Parts you'd source (AliExpress-findable):**
  - A **CsI(Tl) or NaI(Tl)** scintillator crystal (common sizes 6x6x6mm up to
    1"x1"x1"). CsI(Tl) is mechanically stronger and much less hygroscopic
    than NaI(Tl), grows in large quantities cost-effectively, and absorbs
    high-energy gamma rays well — good tradeoff for a hobby build vs NaI's
    slightly better light yield but fragility/moisture sensitivity. 
  - A **SiPM** — the MICROFC-60035 (onsemi/SensL) is the part most DIY guides
    reference and is what RadiaCode itself reportedly uses.
  - A small **readout/preamp PCB** — a passive SiPM readout PCB can be built
    for under $5 in parts, or just use the Open Gamma Detector's board. 

Rough total cost lines up with what the physics-teaching community quotes:
crystal under $50, SiPM around $10, readout PCB under $5 — plus your
MCU/logging layer, which for you is basically free given your Arduino/RS-485
experience. If you want, I can sketch out how you'd wire the SiPM bias supply
and pulse-shaping stage, or how the Open Gamma Detector firmware structures
its MCA — just say the word. 

[Advlab](https://advlab.org/Imm2023USD_CsI-SiPM_Detectors)

## Thu 23 Jul

### ELectronics

- **Your Powerbank has 1 BIG Problem! (That we can "Hack") - GreatScott!**

  [![
    Your Powerbank has 1 BIG Problem! (That we can "Hack") - GreatScott!
  ](http://img.youtube.com/vi/ty5JueA1wRc/0.jpg)](https://youtu.be/ty5JueA1wRc)

  - get around no load attached turning power bank off
  - can be 30 - 140 mA to keep power bank on
  - USB C can get around this
    - need PD delivery board
    - [AliExpress: ~$2 100W 5A USB-C Fast Charge Trigger Board Module PD/QC
      Decoy Board Fast Charge USB Type-c PD 2.0 3.0 Power Delivery Boost
      Module](https://www.aliexpress.com/item/1005005574705710.html)
    - 2 USB cables, need USB C power bank
  - put a resistor in series - but turns into a heater
  - use 555 to spike current - 12x smaller than before
  - hack power bank
  - or use circuit
    - [AliExpress: ~$5 P5328P Charging Po Bidirectional Fast Charge Switch
      Module Of The Mobile Motherboard Power 3.7V Boost
      5V9V12V](https://www.aliexpress.com/item/4000574214602.html)
    - uses a 10 milli Ohm for current measurements - change the shunt resistor
      - 200mOhm shunt - 20x smaller
      - but 5V looses its flatness but still OK

- nice build using old ATX power supply

  - Before You Trash Your Old PC Power Supply... Build This! - JSK-koubou

  [![
    Before You Trash Your Old PC Power Supply... Build This! - JSK-koubou
  ](http://img.youtube.com/vi/iFABNlbl7n8/0.jpg)](https://youtu.be/iFABNlbl7n8)

### Lora long distance

- **How LoRa (ExpressLRS) Drone Receivers Work - JustFPV**

  [![
    How LoRa (ExpressLRS) Drone Receivers Work - JustFPV
  ](http://img.youtube.com/vi/ssmQkRkXE84/0.jpg)](https://youtu.be/ssmQkRkXE84)

    - great reasoning why LoRa works long distance above noise floor
    - soon [https://opendrone.be/collections/all](
      https://opendrone.be/collections/all)

- **How to Train YOLOX on a Custom Dataset - Roboflow**

  [![
    How to Train YOLOX on a Custom Dataset - Roboflow
  ](http://img.youtube.com/vi/q3RbFbaQQGw/0.jpg)](https://youtu.be/q3RbFbaQQGw)

### Tech

- stream deck
  - [https://www.instructables.com/STREAM-DECK-KILLER-and-OpenSource/](
    https://www.instructables.com/STREAM-DECK-KILLER-and-OpenSource/)

- **How Gusto’s CTO uses Claude Code to ship like a startup - How I AI**

  [![
    How Gusto’s CTO uses Claude Code to ship like a startup - How I AI
  ](http://img.youtube.com/vi/5FKBkUCaLa8/0.jpg)](https://youtu.be/5FKBkUCaLa8)

  - good watch on dropping all formal processes
  - having a drop in zoom the whole day long
  - 9 minutes to review
  - got the designer committing

- **Effective Code Reviews with Conventional Comments • Paul Slaughter &
  Adrienne Braganza • GOTO 2025 - GOTO Conferences**

  [![
    Effective Code Reviews with Conventional Comments • Paul Slaughter &
    Adrienne Braganza • GOTO 2025
  ](http://img.youtube.com/vi/7oIs4kNH65Y/0.jpg)](https://youtu.be/7oIs4kNH65Y)
  - author of LGTM review book - waiting to watch

- **TigerBeetle: World’s Fastest Financial Transactions Database - The Geek
  Narrator**

  [![
    TigerBeetle: World’s Fastest Financial Transactions Database - The Geek
    Narrator
  ](http://img.youtube.com/vi/nTbQD30rk14/0.jpg)](https://youtu.be/nTbQD30rk14)

### Other YouTube

- https://www.youtube.com/@ChrisCappy/videos good on war stuff
- https://www.youtube.com/@Gametheory101

### Pilbra inspo

- https://reneweconomy.com.au/fortescue-says-regenerative-infinity-train-may-be-on-tracks-in-two-years/
![](https://reneweconomy.com.au/wp-content/uploads/2022/03/PilbaraTrainIronOreFMG.jpg)

- https://www.australianmining.com.au/what-are-the-safety-values-of-autonomous-mining-vehicles/
![](https://www.australianmining.com.au/wp-content/uploads/2020/09/Rio-Tinto-Driverless-Train-2-Hi-Res_1_-1-scaled-e1599444538954.jpg)

- https://www.itnews.com.au/news/rio-tintos-autonomous-train-makes-first-solo-pit-to-port-delivery-497992
![](https://i.nextmedia.com.au/Utils/ImageResizer.ashx?n=https%3a%2f%2fi.nextmedia.com.au%2fNews%2fRio_Tinto_Pilbara_train.jpg&h=420&w=748&c=0&s=0)

- https://railfan.com/the-pilbara-a-vast-and-magic-land/
![](https://railfan.com/wp-content/uploads/2025/10/rfr-pilbara-vast-and-magic-land-03.jpg)

- LOT's here
  - https://www.facebook.com/groups/1174644643891851/posts/1492699252086387/
  ![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ6YSn8Fle6I65smWeYInN0Dj4U9WnVx7mpoCQTFtI_g&s=10)

### Model railroad

Seems the recommendation is to use 1-2 inch foam on top of a 1/2 inch (12mm)
ply or similar. It allows for carving out the scenary and adding things like
trees easily. It does make for a thick layout.

On attaching kato unitrack to the foam [Reddit: attach kato unitrack](
https://www.reddit.com/r/modeltrains/comments/1tbxd27/easily_removable_ways_to_secure_kato_unitrack/)
seems there is:
- white glue along edge - can use water later to unstick
- drill through the holes from bottom and put small nails from top
- can put on cork which is glued to the foam
- use hot gule - although hard to undo later

This is the XPS type foam board recommended
- [Bunnings 1200x600x30mm XPS foam boar](
  https://www.bunnings.com.au/bastion-1200-x-600-x-30mm-xps-multi-use-foam-board_p0461085)

- More discussion on using foam board and even using sewing pins to pit it down
  [Reddit: foam or no foam](
  https://www.reddit.com/r/modeltrains/comments/1d3pkva/foam_or_no_foam/)

**Some good ideas on a small loop** complete layout
- [https://www.steves-trains.com/post/desktop-micro-layout-17-x-30](
  https://www.steves-trains.com/post/desktop-micro-layout-17-x-30)

- **Building a 17"x30" N Scale Model Railroad - Steve's Trains**

  [![
    Building a 17"x30" N Scale Model Railroad - Steve's Trains
  ](http://img.youtube.com/vi/nQIo-JivKJw/0.jpg)](https://youtu.be/nQIo-JivKJw)

A good channel overall with
- [https://www.youtube.com/@BudgetModelRailways/videos](
  https://www.youtube.com/@BudgetModelRailways/videos)
  - **Diesels Shunting/ Switching on my model railway layout - Budget Model
    Railways**

    [![
      Diesels Shunting/ Switching on my model railway layout - Budget Model
      Railways
    ](http://img.youtube.com/vi/oKYF1nRqySk/0.jpg)](https://youtu.be/oKYF1nRqySk)

  - N Gauge Oval Model Railway layout with lots of operating potential. Ideal
    for Bringing - Budget Model Railways

    [![
      N Gauge Oval Model Railway layout with lots of operating potential. Ideal
      for Bringing - Budget Model Railways
    ](http://img.youtube.com/vi/oEPTSfpbjZA/0.jpg)](https://youtu.be/oEPTSfpbjZA)

  - Model Railway end to end shed layout, baseboard and track plan - Budget
    Model Railways

    [![
      Model Railway end to end shed layout, baseboard and track plan - Budget
      Model Railways
    ](http://img.youtube.com/vi/sqhqr4aW2sg/0.jpg)](https://youtu.be/sqhqr4aW2sg)

    - **end-to-end** layout

  - Model Railway Shunting Test Track - Budget Model Railways

    [![
      Model Railway Shunting Test Track - Budget Model Railways
    ](http://img.youtube.com/vi/pmZQUH8kLFM/0.jpg)](https://youtu.be/pmZQUH8kLFM)

  - STEAM TRAINS RUNNING ON MY MICRO LAYOUT - Budget Model Railways

    [![
      STEAM TRAINS RUNNING ON MY MICRO LAYOUT - Budget Model Railways
    ](http://img.youtube.com/vi/HKEE-Qy_erY/0.jpg)](https://youtu.be/HKEE-Qy_erY)

    ```
         /==================\
       /                      \
     /                          \
    |                            |
    |                /           |
     \             /            /
       \         /            /
         \==================/
      ===============/
    ```

  - N Gauge Shelf Layout in a Summer House - Budget Model Railways

    [![
      N Gauge Shelf Layout in a Summer House - Budget Model Railways
    ](http://img.youtube.com/vi/j2U862MoN9c/0.jpg)](https://youtu.be/j2U862MoN9c)

    - high up - the idea of along a window ledge or roof line

  - Model Railway Inspiration | Micro Layouts - SHGP Media

    [![
      Model Railway Inspiration | Micro Layouts - SHGP Media
    ](http://img.youtube.com/vi/18PFm0UtJmM/0.jpg)](https://youtu.be/18PFm0UtJmM)

    - some good inspiration

  - #29 - Building a Micro Shunting Layout - Pt. 1 - Baseboards - Horsehay
    Railway Modeller

    [![
      #29 - Building a Micro Shunting Layout - Pt. 1 - Baseboards - Horsehay
      Railway Modeller
    ](http://img.youtube.com/vi/I5mKz5kFJjY/0.jpg)](https://youtu.be/I5mKz5kFJjY)

  - N Scale Layout on a Door Ideas - Steve's Trains

    [![
      N Scale Layout on a Door Ideas - Steve's Trains
    ](http://img.youtube.com/vi/5pUP17EWcMo/0.jpg)](https://youtu.be/5pUP17EWcMo)

    - [ ] probably worth a look

  - 121 - N Scale Tabletop layout design with KATO UNITRACK - Model Railroad
    Designs

    [![
      121 - N Scale Tabletop layout design with KATO UNITRACK - Model Railroad Designs
    ](http://img.youtube.com/vi/hWfi2cfgBxk/0.jpg)](https://youtu.be/hWfi2cfgBxk)

    - [ ] might be worth taking a look

  - A STRAIGHT FORWARD Guide to Kato Unitrack: Tips, Tricks, and Hacks - DIY
    and Digital Railroad

    [![
      A STRAIGHT FORWARD Guide to Kato Unitrack: Tips, Tricks, and Hacks - DIY
      and Digital Railroad
    ](http://img.youtube.com/vi/wKAPjzdXWLA/0.jpg)](https://youtu.be/wKAPjzdXWLA)

    - [ ] worth checking out, might learn something

  - How To Make A Shunting / Switching Layout On A Window Ledge - Shelf Layout - Budget Model Railways

    [![
      How To Make A Shunting / Switching Layout On A Window Ledge - Shelf
      Layout - Budget Model Railways
    ](http://img.youtube.com/vi/nB-nJ9xLV8Y/0.jpg)](https://youtu.be/nB-nJ9xLV8Y)

    - don't really rate this but a lot of switching and means just do it

- my dream has always been something like below
```
=========/===============\
     /==/===============\ \
   /                      \ \
 /                          \ \
|                  /         | |
|                 /=======   | |
|                /           | |
 \     ========/            / /
   \         /            / /
     \=============\====/ /
====================\===/
```

Some good and cheap hints

- Scenery Tutorial - Dry wash and Desert Hills of Nevada - Model Trains

  [![
    Scenery Tutorial - Dry wash and Desert Hills of Nevada - Model Trains
  ](http://img.youtube.com/vi/Fx98jNNqCHA/0.jpg)](https://youtu.be/Fx98jNNqCHA)

  - cardboard and plaster strips as a background
  - plaster mixed with things like grout, use of colour, use of white vinegar
    to make plaster useable for longer
  - lot of steps and good hints - worth another look

- How to Add Photo Backdrops to Your Model Railroad Part 2 - Model Trains

  [![
    How to Add Photo Backdrops to Your Model Railroad Part 2 - Model Trains
  ](http://img.youtube.com/vi/w8Ycd36-hmo/0.jpg)](https://youtu.be/w8Ycd36-hmo)

  - take photos, or use google street view, get a 360
    [https://svd360.istreetview.com/](https://svd360.istreetview.com/)
  - remove sky and replace with sky you want
  - nothing about actually printing
  - a lot about composition

- Building an HO Scale Model Railroad: Desert Scenery (02) - Model Railroading
  The Southwest

  [![
    Building an HO Scale Model Railroad: Desert Scenery (02) - Model
    Railroading The Southwest
  ](http://img.youtube.com/vi/_SwLQEld8Rs/0.jpg)](https://youtu.be/_SwLQEld8Rs)

  - nice dessert outcome but not much on how it was done

- Cheap Model Railroad Backdrop hack that looks awesome! - DIY and Digital
  Railroad

  [![
    Cheap Model Railroad Backdrop hack that looks awesome! - DIY and Digital
    Railroad
  ](http://img.youtube.com/vi/XGlZXXiTxSk/0.jpg)](https://youtu.be/XGlZXXiTxSk)

  - using an existing cloud backdrop
    [https://www.amazon.com/Fadeless-Bulletin-Board-Paper-Clouds/dp/B001AFHVWO](
    https://www.amazon.com/Fadeless-Bulletin-Board-Paper-Clouds/dp/B001AFHVWO)
  - hold in place with tape and then use double sided tape to keep it in place
    for final spot.

- Complex N-scale track plans with loops
  - [https://www.steves-trains.com/post/n-scale-track-plans](
    https://www.steves-trains.com/post/n-scale-track-plans)
  - [http://www.cke1st.com/m_train2.htm](
    http://www.cke1st.com/m_train2.htm)
    - last 2 are **End-to-End** shunting style

- Small Double Deck N Scale Kato Layout Part 1 - Less is More - rhopkin2512

  [![
    Small Double Deck N Scale Kato Layout Part 1 - Less is More - rhopkin2512
  ](http://img.youtube.com/vi/8GB01sQoma8/0.jpg)](https://youtu.be/8GB01sQoma8)
  - oval layout but diconnected double decker sounds like a good interesting
    idea with tunnles hiding most loops

## Sat 4 Jul

### Rails Camp - Ruby Retreat

building peregrion and trackign antennas on the drive up

- [https://peregrino.pair-with.me/](
  https://peregrino.pair-with.me/)
  - [https://github.com/saramic/peregrino](
    https://github.com/saramic/peregrino)
- [https://app.spectaura.com.au/search/site/141123](
  https://app.spectaura.com.au/search/site/141123)
  - [https://www.google.com/maps/@-36.7116535,149.8206492,125m](
    https://www.google.com/maps/@-36.7116535,149.8206492,125m)

- wanting to make cool wave animation
  - [https://andrew.wang-hoyer.com/experiments/svg-animations/25/c/](
     https://andrew.wang-hoyer.com/experiments/svg-animations/25/c/)
  - with this simple cut & paste path editor
  - [https://yqnn.github.io/svg-path-editor/](
    https://yqnn.github.io/svg-path-editor/)
- Ran into Mike Baily who is all in on voice powred AI - 16 hours a day, 7 days a week
  - His AI has a blog [https://cora7.com/tags/shit-my-human-says/](
    https://cora7.com/tags/shit-my-human-says/)

- can you calculate the speed of sound by measuring hot spots created in
  chocolate using a micrwave?
  - [https://github.com/saramic/learning/blob/master/demo/speed-of-light-microwave/speed-of-light-w-microwave-and-chocolate.ipynb](
    https://github.com/saramic/learning/blob/master/demo/speed-of-light-microwave/speed-of-light-w-microwave-and-chocolate.ipynb)

- The Insane Genius of a Formula 1 Gearbox - Driver61
    - https://www.youtube.com/watch?v=8E1ecqCo6gM
    - the idea of one gear pushing a ramp to auto shift off the other gear 3ms
      gear changes

- The Untold Story of SSH - CodeSource
    - https://www.youtube.com/watch?v=1UX_iTdrtbc
    - interesting overview of all the things

- Discussed cut-out for GPS over Mach I and 18,000 feet as well as 9Hz refresh
  rate on IR cameras - both baked in limitations due to restrictions to prevent
  creating missiles.

- Building the Most Efficient Drone Ever Made - Luke Maximo Bell
    - [https://www.youtube.com/watch?v=cA1Asda-jTk](
      https://www.youtube.com/watch?v=cA1Asda-jTk)
    - most drone configuration with https://ardupilot.org/
    - example of metrics overlay OSD (On Screen Display
        - https://www.youtube.com/watch?v=s7ibF5_pUOU&t=32s
    - also
      - https://goprotelemetryextractor.com/drone-heads-up-display
      - https://mydroneviewer.com/

- Ubuntu touch on Nothing Phone 1
  - Android 17 sucks. So I put Linux on a phone. - Switch and Click
  - https://www.youtube.com/watch?v=wTK6TS3pXgc

## Voicemode in claude

- VoiceMode for Claude Code: Conversational Coding - VoiceMode
    - https://www.youtube.com/watch?v=cYdwOD_-dQc
    - https://github.com/mbailey/voicemode


## Voicesmith

- https://ryanbigg.com/wordsmith
- https://github.com/radar/wordsmith/blob/main/src/levels.ts

## calling voice

```sh
# install
brew install sox

# record
sox -d -r 16000 -c 1 /tmp/test.wav trim 0 5

    Input File     : 'default' (coreaudio)
    Channels       : 1
    Sample Rate    : 16000
    Precision      : 32-bit
    Sample Encoding: 32-bit Signed Integer PCM

    In:0.00% 00:00:05.02 [00:00:00.00] Out:80.0k [      |      ]        Clip:0
    Done.

# transcribe
curl http://localhost:2022/v1/audio/transcriptions \
    -F file=@/tmp/test.wav \
    -F model=whisper-1
{"text":" This is its first.\n"}%

# TTS
curl http://localhost:8880/v1/audio/speech \
    -H "Content-Type: application/json" \
    -d '{"model": "kokoro", "input": "Hello world", "voice": "af_sky"}' \
    --output /tmp/speech.mp3 && afplay /tmp/speech.mp3
```

also list voices

```
curl -s http://localhost:8880/v1/audio/voices
{"voices":["af_alloy","af_aoede","af_bella","af_heart","af_jadzia","af_jessica",
"af_kore","af_nicole","af_nova","af_river","af_sarah","af_sky","af_v0",
"af_v0bella","af_v0irulan","af_v0nicole","af_v0sarah","af_v0sky","am_adam",
"am_echo","am_eric","am_fenrir","am_liam","am_michael","am_onyx","am_puck",
"am_santa","am_v0adam","am_v0gurney","am_v0michael","bf_alice","bf_emma",
"bf_lily","bf_v0emma","bf_v0isabella","bm_daniel","bm_fable","bm_george",
"bm_lewis","bm_v0george","bm_v0lewis","ef_dora","em_alex","em_santa","ff_siwis",
"hf_alpha","hf_beta","hm_omega","hm_psi","if_sara","im_nicola","jf_alpha",
"jf_gongitsune","jf_nezumi","jf_tebukuro","jm_kumo","pf_dora","pm_alex",
"pm_santa","zf_xiaobei","zf_xiaoni","zf_xiaoxiao","zf_xiaoyi","zm_yunjian",
"zm_yunxi","zm_yunxia","zm_yunyang"]}%
curl -s http://localhost:8880/v1/models
{"object":"list","data":[{"id":"tts-1","object":"model","created":1686935002,
"owned_by":"kokoro"},{"id":"tts-1-hd","object":"model","created":1686935002,
"owned_by":"kokoro"},{"id":"kokoro","object":"model","created":1686935002,
"owned_by":"kokoro"}]}%
```

## to clone your own voices

```
 /voicemode:impressions

⏺ To clone your own voice you need three things:

  1. Install mlx-audio (one-time, ~3.4 GB download on first use):
  ! voicemode service install mlx-audio

  2. Record a 5-9 second clip of yourself:
  sox -d -r 24000 -c 1 ~/my-voice.wav trim 0 8

  3. Register it:
  voicemode clone add myvoice ~/my-voice.wav

  Then use it:
  # Via CLI
  voicemode converse --voice myvoice

  # Via curl
  curl http://localhost:8890/v1/audio/speech \
    -H "Content-Type: application/json" \
    -d '{"model": "qwen3-tts", "input": "Hello!", "voice": "/Users/michael/.voicemode/voices/myvoice/default.wav"}' \
    --output /tmp/out.mp3 && afplay /tmp/out.mp3

  Key gotcha: always provide a transcript of your reference clip to avoid stuttering:
  # After adding, edit the transcript in voice.md to make sure it's accurate
  open ~/.voicemode/voices/myvoice/voice.md

  Want to go ahead and install mlx-audio?
```

## attempt to create a voice

```sh
# record my voice
sox -d -r 24000 -c 1 ~/my-voice.wav trim 0 8

# generate the voice
voicemode clone add myvoice ~/my-voice.wav

# attempt to use it
curl http://localhost:8890/v1/audio/speech \
    -H "Content-Type: application/json" \
    -d "{\"model\": \"qwen3-tts\", \"input\": \"Hello, this is my voice\", \
        \"voice\":\"$HOME/.voicemode/voices/myvoice/default.wav\"}"
    --output /tmp/out.mp3
```

Heard about RTK GPS for cm precision

- https://www.agsgis.com/RTK-GPS-Explained_b_6.html

- arguments around charging cells
  - https://www.reddit.com/r/batteries/comments/6g4t70/charging_18650_with_a_cccv_bench_power_supply/

cannot watch anymore
  - Planned Obsolescence documentary - The Light Bulb ...
YouTube · Documentary For Better World
16 Apr 2017
YouTube · Documentary For Better World

52:49
Planned obsolescence, a secret mechanism in our consumer society, has defined
our lives since the 1920s when manufacturers shortened product lifespans.
  - https://www.youtube.com/watch?v=wzJI8gfpu5Y

- https://docs.ultralytics.com/datasets/pose/dog-pose#introduction
- https://public.roboflow.com/


- The chair Mike Baily recommends
  - https://darche.com.au/collections/camping-chairs/products/revolver-chair

why not build a streamdeck
- $189 on amazon https://www.amazon.com.au/Elgato-Stream-Deck-MK-2-Controller/dp/B09738CV2G/
- build you own
    - I Built a Stream Deck with ESP32 for Under $5 (And It Actually Works) -
      mahaataab
    - https://www.youtube.com/watch?v=YZCfMAeuCcw
    - cadboard, esp32, OLED and 4 buttons
- https://www.producthunt.com/products/ottomate-io
    > Take control of your digital environment with ottomate. We replace rigid
    > hardware with a versatile ecosystem offering two powerful inputs: a fully
    > freeform touch deck for your mobile devices and a privacy-first voice
    > engine. Use Local AI to execute complex macros, manage windows, and
    > launch apps hands-free without cloud snooping. Profiles sync to the cloud
    > for portability, but all processing stays on your machine for speed and
    > security.
- OBS controller based on a NANO
    - How to make an OBS Live Stream Controller (DIY Stream Deck) - Risto
      Innovates
    - https://www.youtube.com/watch?v=WBtp0F-prsM
    - interesting: solder on berad board for alignment, solder iron heating
      "heat set inserts" nuts into enclosure, flux prior to soldering
    - creates each 3D print 5 times - super slow and over complicated
