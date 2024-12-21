---
layout: post
title:  "December 2024 - metal detectors"
date:   2024-12-21 19:00:00 +1100
categories: learning update electronics
---

# Metal Detector

I am interested in making a relatively simple metal detector, similar to the
ones used in airports to scan people for metal, more of a gimmick thing. I was
thinking that having it work with an Arduino, would make it more flexible, so
that or an ESP32 would be a plus. I have seen some crazy metal detectors used
to find meteorites deep underground (6 feet) and that also does intrigue me a
little, so off I went on the internets to do some background reading.

## Background reading

Looking at my first go to magazine - Silicon Chip, it turned up a couple of
recent artilces on metal detectors

- this feature
  [https://www.siliconchip.com.au/Issue/1998/May/A+Detector+For+Metal+Objects](
  https://www.siliconchip.com.au/Issue/1998/May/A+Detector+For+Metal+Objects)
- And a mention in Notes & Errata of June 2017 issue that the March 2017 issue
  had an ATmega-based Metal Detector with stepped frequency indication
    - [SC 2017 June: ATmega-based Metal Detector with stepped frequency indication](
      https://www.siliconchip.com.au/Issue/2017/June/Micromite+LCD+BackPack+V2+-+ATmega-based+Metal+Detector+with+stepped+frequency+indication+%28Notebook+Mar17%29)
- Taking a look at SC March 2017 issue on page 86 I get a greyed out preview
  only bocker [https://www.siliconchip.com.au/Issue/2017/March](
  https://www.siliconchip.com.au/Issue/2017/March)

I am a little surprised that Silicon chip does not provide previewes for things
like reader submitted circuits

But presumably that person or someone else would have published such a thing
online, so I searched

> "atmega based metal detector with stepped frequency indication"

A bunch of promising "images" came up including

- https://www.instructables.com/Minimal-Arduino-Metal-Detector/
- https://www.instructables.com/Simple-Arduino-Metal-Detector/
- https://simplemetaldetector.com/pulse-induction-metal-detectors/metal-detector-avr-microcontroller/
- https://circuitcellar.com/research-design-hub/projects/advanced-metal-detector/
- https://forum.arduino.cc/t/pulse-induction-metal-detector-rx-methods/683722
- https://github.com/microchip-pic-avr-examples/pic18f56q71-opamp-metal-detector-mplab-mcc
- https://www.electroschematics.com/metal-detector/
- https://circuitdigest.com/microcontroller-projects/arduino-metal-detector-circuit-code
- https://www.electronicshub.org/metal-detector-circuit/

All of which are probably worth reading up on to get some background
information and different circuit ideas.

Finally this one stuck out
- https://simplemetaldetector.com/pulse-induction-metal-detectors/arduino-based-pulse-induction-detector/
- also on instructables [https://www.instructables.com/Arduino-Based-Pulse-Induction-Detector/](
  https://www.instructables.com/Arduino-Based-Pulse-Induction-Detector/)
  The idea was to do away with most signal processing components. The Arduino
  runs at 16MHz and has 0.0625µS reslution on clock speed which is not enough.
  Instead comparing voltage drop over time to a fixed reference voltage and
  using the D6 - D7 internal comparator to trigger an interrupt is what this
  design uses. The idea comes from TPMID - Tiny Pulse Induction Metal Detector
  home page - www.miymd.com/index.php/projects/tpimd/ now available here
  [webArchive: - www.miymd.com tpimd](
  https://web.archive.org/web/20160713212419/http://www.miymd.com/index.php/projects/tpimd)
  It sounds like these circuits usually have 2 voltages, to get around that
  here, the circuit is triggered and then a MOSFET is used to isolate the coil
  and bleed it via a 220Ω resistor. A voltage divider sets a voltage of around
  0.04V and this is used in the comparator to trigger when it is reached. If
  metal is near the coil, the decay curve lasts longer and the interrupt gets
  longer. The detector works but is of limited capability, still it uses
  Arduino so might be worth checking out.

It had a relatively simple Arduino and minimal external components but also
details of the limitations on Arduino's being able to detect the frequency
changes quickly enough and some work arounds as well as references to older and
even non existant sites.

one of these is this article
- [https://www.basic4mcu.com/bbs/board.php?bo_table=k1&wr_id=17&page=3](
  https://www.basic4mcu.com/bbs/board.php?bo_table=k1&wr_id=17&page=3)
- [webArchive: - www.miymd.com tpimd](
  https://web.archive.org/web/20160713212419/http://www.miymd.com/index.php/projects/tpimd)

Which lead to a few more reads from the miymd.com site
- Metal detector types
    - [webArchive: miymd mdtypes](
      https://web.archive.org/web/20160728015924/http://www.miymd.com/index.php/mdtypes)
    - referencing radioShack
        - [webArchive: radioShack metal detector types](
          https://web.archive.org/web/20081220070531/http://www.radioshack.com/uc/index.jsp?page=researchLibraryArticle&articleUrl=..%2Fgraphics%2Fuc%2Frsk%2FResearchLibrary%2FBuyersGuides%2Fresearch%2FMetalDetectors01.html)
- TPIMD - Tiny Pulse Induction Metal Detector
    - [webArchive: miymd projects](
      https://web.archive.org/web/20160709080241/http://www.miymd.com/index.php/projects)
- XPI
    - [webArchive: miymd xpi](
      https://web.archive.org/web/20170708192428/http://www.miymd.com/index.php/projects/xpi/)
- Technology behind Pulse Induction Metal Detecors, Tramsmitter TX and
  Receiver RX
    - [webArchive: miymd pulse induction](
      https://web.archive.org/web/20170402124230/http://miymd.com/index.php/mdtypes/pulse-induction/)

from some of the comments this lead me to

Gary's Pulse Induction Metal Detector
  - [http://chemelec.com/Projects/Metal-1a/Metal.htm](
    http://chemelec.com/Projects/Metal-1a/Metal.htm) (_not sure how long this
    site will be around as it says the author is closing it down_)
  - a bunch of projects here but not all have schematics, some simple ones
    below
  - [http://chemelec.com/Projects/Metal-BFO-1/BFO-1.htm](
    http://chemelec.com/Projects/Metal-BFO-1/BFO-1.htm)
    ![](http://chemelec.com/Projects/Metal-BFO-1/BFO-1.png)
  - [http://chemelec.com/Projects/Metal-BFO-2/BFO-2.htm](
    http://chemelec.com/Projects/Metal-BFO-2/BFO-2.htm)
    ![](http://chemelec.com/Projects/Metal-BFO-2/BFO-2-Schematic.png)

As well as some other random but interesting work on mini Maximite
- [https://geoffg.net/mini-maximite.html](
  https://geoffg.net/mini-maximite.html)
- [https://geoffg.net/MonoMaximite.html](
  https://geoffg.net/MonoMaximite.html)

which lead to this

[https://www.geotech1.com/cgi-bin/pages/common/index.pl?page=metdet&file=projects.dat](
https://www.geotech1.com/cgi-bin/pages/common/index.pl?page=metdet&file=projects.dat)

- Metal Detector Projects
    - Frequency-shift Detectors
    - Induction Balance Detectors
        - ETI549 (Aus) (ETI, Australian version) Basic IB Detector
            - [https://www.geotech1.com/pages/metdet/projects/eti549au/eti549au_300.pdf](
              https://www.geotech1.com/pages/metdet/projects/eti549au/eti549au_300.pdf)
        - Matchless Metal Locator (Thomas Scarborough, Silicon Chip) - World's
          simplest (?) IB design
            - [https://www.geotech1.com/pages/metdet/projects/matchless/matchless300c.pdf](
              https://www.geotech1.com/pages/metdet/projects/matchless/matchless300c.pdf)
              Full SC article in the link above. It covers off a simpler
              "induction balance" IB design using 2 coils and 2 555 timers. One
              transmits a signal and the other one detects it, as the signal is
              in the audible range, it powers some headphones using your ears
              to detect the presence of a coin at 15cm's in air. Also a fair
              bit of detailed construction using PVC tubing. Certainly a simple
              desing that could translate to Arduino with some square waves and
              ADC of sound?
        - Shadow IB Detector (ETI)
            - [https://www.geotech1.com/pages/metdet/projects/shadow/shadow300.pdf](
              https://www.geotech1.com/pages/metdet/projects/shadow/shadow300.pdf)
    - Pulse Induction Detectors
        - EE Treasure Hunter - Mark Stuart, Everyday Electronics
            - [https://www.geotech1.com/pages/metdet/projects/stuart1/stuart1_300.pdf](
              https://www.geotech1.com/pages/metdet/projects/stuart1/stuart1_300.pdf)
        - Gary's Pulse Induction Metal Detector (from Gary's Chemelec web site)
            - with the original domain, now only available on the way back machine, but still no circuit diagram
                - [webArchive: http://www3.telus.net/chemelec/Projects/Metal/Metal.htm](
                  https://web.archive.org/web/20070311003946/http://www3.telus.net/chemelec/Projects/Metal/Metal.htm)
            - now [http://chemelec.com/Projects/Metal-1a/Metal.htm](
              http://chemelec.com/Projects/Metal-1a/Metal.htm)
        - Twin Loop Treasure Seeker - Robert & David Crone ETI
            - [https://www.geotech1.com/pages/metdet/projects/twinloop/twinloop.pdf](
              https://www.geotech1.com/pages/metdet/projects/twinloop/twinloop.pdf)
    - Misc
        - Coil winder, coplanar search coils and probe detectors
