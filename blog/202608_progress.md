# Progress August 2026

## Fri 21 Aug

### One person company with AI

https://polsia.com/

### Microscopy

- mushrooms https://www.mushroomexpert.com/microscope.html

### AI for ideas

- https://superwhisper.com/ - for talking to computer
- https://circleback.ai/ for meeting notes
- https://www.granola.ai/ for meeting notes

### Mining

- get a permit
- hand tools only
- options
    - Gold: Found heavily in Central and North-Eastern Victoria (the "Golden
      Triangle") in quartz reefs and alluvial creek beds.
    - Sapphire: Frequently recovered from alluvial gravel beds around
      Beechworth, Yackandandah, and the Dargo/Gippsland areas.
    - Topaz: Often discovered alongside sapphires and heavy wash in historic
      tin and gold-bearing streams.
    - Zircon: Small, clear-to-red gem-quality zircons are common in alluvial
      deposits across the state's northeast and Gippsland.
    - Quartz (and Amethyst/Jasper): Massive quartz veins run throughout the
      Victorian goldfields, carrying colorful micro-varieties like jasper,
      chalcedony, and smoky quartz.
    - Garnet: Small semi-precious gem crystals appear in regional stream
      gravels and metamorphic rock zones.

    - tin (cassiterite), primarily concentrated around the granitic terrains
      near Warburton, Mount Beenak, and the Bunyip State Forest.
        - Toora is best bet
      - Identifying Cassiterite in Your Pan
        - When DIY mining, you will look for "Stream Tin." Because it is so
          heavy, it will settle into the very bottom ridge of your pan,
          alongside or right behind the black iron sands (magnetite).
        - Appearance: Usually behaves like tiny, heavy pebbles or coarse sand.
          It is typically dark brown, pitch black, or grey-brown.
        - Lustre: Sub-metallic to resinous; it has a slightly shiny, waxy coat
          when dry.
        - The Scratch Test: Cassiterite is incredibly hard (Mohs hardness 6 to
          7). Unlike soft lead or dark zinc blende minerals, raw cassiterite
          will easily scratch glass.
        If you plan a trip to one of these fields, would you like more details
        on how to set up an alluvial sluice box to process the higher volumes
        of gravel needed for tin, or do you need a list of local campgrounds
        near Eldorado?

A tech solution:
mimic an industrial gravity circuit:[ Raw Silt / Gravel Input ]
```
           │
           ▼
┌──────────────────────────────────────┐
│       Rotating Trommel Screen        │ ──> (Rejects large rocks > 2mm)
└──────────────────────────────────────┘
           │
           ▼ (Fine slurry)
┌──────────────────────────────────────┐
│        Fluidised Sluice Box          │ ──> (Flushes out light quartz sands)
└──────────────────────────────────────┘
           │
           ▼ (Heavy concentrate drop)
┌──────────────────────────────────────┐
│   Recirculating Wave / Shaker Table   │ ──> (Physically splits heavy black tin
└──────────────────────────────────────┘      from lighter sands into a neat stream)
```

- Classification (The Trommel): A small motorized, rotating mesh drum washes
  the silt and screens out everything larger than \(2\text{ mm}\).
- Primary Concentration (The Fluidised Sluice): The fine slurry runs over a
  small, vibrating or fluidised sluice box. Water pressure washes away \(95\%\)
  of the light quartz and clay, leaving behind a highly concentrated mix of
  heavy black sands.
- Final Splitting (The Shaker/Wave Table): You dump this heavy concentrate onto
  a flat, gently sloping table that shakes rapidly sideways while water flows
  across it. Because cassiterite has a specific gravity of \(\approx 7.0\) and
  magnetite is \(\approx 5.1\), the table's shaking action forces the heavier
  tin to walk along a completely different diagonal path than the iron sand. It
  splits them into two distinct, visible streams dropping into separate buckets
  perfectly—no complex cameras or centrifuges required.

## Wed 5 Aug

### Data transfer

- https://themartec.slack.com/archives/C09KC38NB7A/p1785906722221499
- https://github.com/bashalarmistalt/decimen-optical-transfer/

QR like image allows for transfer up to 130 KB/s - AI vibe coded in 1 night

## Mon 1 Aug

### PID

PID stands for **Proportional**, **Integral**, and **Derivative**. It refers to
a type of feedback-based control loop mechanism used to automatically adjust
and manage systems (like temperature, speed, or pressure) so they reach and
maintain a specific target value.

**PID Balance+Ball | full explanation & tuning - Electronoobs**

[![
  PID Balance+Ball | full explanation & tuning - Electronoobs
](http://img.youtube.com/vi/JFTJ2SS4xyA/0.jpg)](https://youtu.be/JFTJ2SS4xyA)

- video never mentions what PID stands for
- good example of configuring all the values and what they mean
- nice and simple example that can be built
- also mentions a PID, brushless motor balance/scale

### BEAM robotics

forgot all about this, a pretty good build below for a walking robot

**Touchy, feely robot. Beam walker build part 3 - ALTco**

[![
  Touchy, feely robot. Beam walker build part 3 - ALTco
](http://img.youtube.com/vi/dMGzsFv3Dc4/0.jpg)](https://youtu.be/dMGzsFv3Dc4)

### SigInt


5 Low-Cost Tools to Get Started In Signals Intelligence - Civil Defense Engineer

AkqYLihWtlg
[![
  Touchy, feely robot. Beam walker build part 3 - ALTco
](http://img.youtube.com/vi/AkqYLihWtlg/0.jpg)](https://youtu.be/AkqYLihWtlg)

- good overview of the kind of RF you can monitor
  - allocation chart [https://www.ntia.gov/page/united-states-frequency-allocation-chart](
    https://www.ntia.gov/page/united-states-frequency-allocation-chart)
  - [https://www.sigidwiki.com/wiki/Signal_Identification_Guide](
    https://www.sigidwiki.com/wiki/Signal_Identification_Guide)
- tool on the phone
  - BLE Radar https://f-droid.org/en/packages/f.cking.software/
- RTL-SDR for the phone
  - connect RTL-SDR to android via USB C to USB cable
  - https://play.google.com/store/apps/details?id=marto.rtl_tcp_andro&pli=1
  - RTL-SDR https://www.rtl-sdr.com/
  - ADS-B Radar
    - on phone https://play.google.com/store/apps/details?id=me.jajae.adsbradar
  - AirSPY
    - https://airspy.com/download/
- TinySA Ultra use
- KrakenSDR mentioned https://www.krakenrf.com/
- FPV monitor [SoloGood 800*480 5.8G FPV Monitor with DVR](
  https://sologood.net/products/sologood-800-480-5-8g-fpv-monitor-with-dvr-40ch-4-3-inch-lcd-display-16-9-ntsc-pal-auto-search-video-recording)
- For devices search for "RC Micro Camera" or "FPV Camera"


Also back last month this video mentioned ATAK

**I Stole This from the Military - Data Slayer**

[![
  I Stole This from the Military - Data Slayer
](http://img.youtube.com/vi/b7IMBHMjNv8/0.jpg)](https://youtu.be/b7IMBHMjNv8)

**ATAK (Android Team Awareness Kit)** is a software suite originally developed
by the Air Force Research Laboratory (AFRL) for military purposes. It enables
so-called digital operations management and has been tested and optimized in
years of practical use. An important aspect of ATAK is its ability to improve
communication between different partners, especially in emergency situations.

- [https://takhub.de/en/atak-tutorial-for-beginners-step-by-step-guide-to-installation-and-basic-features/](
  https://takhub.de/en/atak-tutorial-for-beginners-step-by-step-guide-to-installation-and-basic-features/)
- [https://github.com/joshuafuller/ATAK-Maps](
  https://github.com/joshuafuller/ATAK-Maps)
- [https://tak.gov/](
  https://tak.gov/)
- [https://mappingsupport.com/p2/atak/display_gis_data_with_atak.html](
  https://mappingsupport.com/p2/atak/display_gis_data_with_atak.html)
- also a well placed book
  [Skunk Works: A Personal Memoir of My Years of Lockheed - Ben R.Rich](
  https://www.amazon.com.au/Skunk-Works-Personal-Memoir-Lockheed/dp/0316743003)
