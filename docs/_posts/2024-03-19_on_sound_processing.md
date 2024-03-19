---
layout: post
title:  "March 2024 - on sound processing"
date:   2024-03-19 23:30:00 +1100
categories: learning update
---

## Programmable Melbourne 2024

- my notes from today [github failure-driven/conference-notes
  NOTES_Programmable_Melbourne_2024.md](https://github.com/failure-driven/conference-notes/blob/main/NOTES_Programmable_Melbourne_2024.md)

## Increasing returns of Highly Maintainable Code

- [x] read [Increasing, not Diminishing: Investigating the Returns of Highly
  Maintainable Code - Markus Borg](https://arxiv.org/pdf/2401.13407.pdf) today
- which in turn makes me want to read:
    - [ ]  [The SPACE of Developer
      Productivity](https://dl.acm.org/doi/pdf/10.1145/3454122.3454124):
      There's more to it than you think.
    - [ ] Modern Software Engineering: Doing What Works to Build Better
      Software Faster Paperback – 10 December 2021 by David Farley
      [Amazon](https://www.amazon.com.au/Modern-Software-Engineering-Really-Better/dp/0137314914)

## Electronics

started looking at the compass module "3-Axis GY-273 HMC5883 3V-5V Triple Axis
Compass Magnetometer Sensor Module for Arduino" as part of the YouTube Festival
Tracker video I saw. It sounds that its all a little bit more complicated

**No Signal, No Problem! DIY ESP32 Festival Tracker Unveiled! - Part 2 - Auryn
Codes**

[![
  No Signal, No Problem! DIY ESP32 Festival Tracker Unveiled! - Part 2 - Auryn
  Codes
](
  http://img.youtube.com/vi/OuZBA1RGSP8/0.jpg
)](https://youtu.be/OuZBA1RGSP8)

- there is a library for
  [https://github.com/jarzebski/Arduino-HMC5883L](https://github.com/jarzebski/Arduino-HMC5883L)
  - and this write up
    [https://www.jarzebski.pl/arduino/czujniki-i-sensory/3-osiowy-magnetometr-hmc5883l.html
    ](https://www.jarzebski.pl/arduino/czujniki-i-sensory/3-osiowy-magnetometr-hmc5883l.html)
  - a demo? [https://github.com/visakhanc/eCompass
  ](https://github.com/visakhanc/eCompass)
  but that may be `HMC` specific and not work for the `GY-273` Chinese clone
  which is actually `QMC5883`
- so should use the library
  [https://www.arduino.cc/reference/en/libraries/qmc5883lcompass/
  ](https://www.arduino.cc/reference/en/libraries/qmc5883lcompass/)
  - [https://github.com/mprograms/QMC5883LCompass
    ](https://github.com/mprograms/QMC5883LCompass)
  - OR? [https://github.com/keepworking/Mecha_QMC5883L
    ](https://github.com/keepworking/Mecha_QMC5883L)
  - and [this](https://forum.arduino.cc/t/any-way-to-use-hmc5883l-library-with-qmc5883l/623793/2)
  > If serial number on the QMC5883L device is "DA5883" then the device is
  > identical to the Honeywell HMC5883L, responds to the I2C addresss 0x1E,
  > except (and I'm not joking) that the status register doesn't work.
  > 
  > If on the other hand the serial number is "DB5883" then the device operates
  > in accordance with the QST Corporation's datasheet and responds to the I2C
  > address 0x0D.

Also interestingly in the festival tracker code the author uses this setup to use a plugin and code Arduino from VSCode

[.vscode/extensions.json
](https://github.com/auryn31/festival_finder/blob/main/.vscode/extensions.json)
```json
{
    // See http://go.microsoft.com/fwlink/?LinkId=827846
    // for the documentation about the extensions.json format
    "recommendations": [
        "platformio.platformio-ide"
    ],
    "unwantedRecommendations": [
        "ms-vscode.cpptools-extension-pack"
    ]
}
```

- [ ]  [https://docs.platformio.org/en/latest/faq/arduino-vs-platformio.html
  ](https://docs.platformio.org/en/latest/faq/arduino-vs-platformio.html)

## New ESP32 board?

**Is this Best ESP32 board? New T-Display S3 ESP32S3 - Volos Projects**

[![
  Is this Best ESP32 board? New T-Display S3 ESP32S3 - Volos Projects
](
  http://img.youtube.com/vi/j8THAc1sMww/0.jpg
)](https://youtu.be/j8THAc1sMww)

## Sound processing

following from my Ham Radio post
[https://saramic.github.io/ham-radio/sbitx/sdr/dsp/2024/03/17/sbitx-hf-sdr.html
](https://saramic.github.io/ham-radio/sbitx/sdr/dsp/2024/03/17/sbitx-hf-sdr.html)
about [A Software-Defined Radio for the Masses, Part 2
](https://saramic.github.io/ham-radio/assets/pdfs/A_Software-Defined_Radio_for_the_Masses_Part_2.pdf)

- got me thinking of how to connect Arduino sound to a computer
- and the quality of ADC/DAC converters
- and writing some of the software
- but maybe in the browser
- even processing radiosonde in the browser?
