# Red Pitaya

[Red Pitaya STEMlab 125-14 PRO Gen 2 Starter Kit!](
https://community.element14.com/products/roadtest/rt/roadtests/711/engineers_wanted_to_review_the_red_pitaya_stemlab_125-14_pro_gen_2_starter_kit)

## Final submitted idea

[./red_pitaya_roadtest_proposal.md](./red_pitaya_roadtest_proposal.md)

Generate PDF with script

```shell
python make_pdf.py
```

as plain old pandoc was ugly and didn't work with some emoji failed (Ω, 🦀)

```shell
pandoc red_pitaya_roadtest_proposal.md -o red_pitaya_roadtest_proposal.pdf
```

## Initial ideas

**Red Pitaya STEMlab 125-14 PRO Gen 2 — Road Test Project Ideas**

> "does this actually replace a bench full of instruments for a maker/engineer
> who doesn't have dedicated lab gear?"

### Tier 1 — Foundations

1. **Instrument App Tour with real signals**

   Don't just screenshot the UI — generate real signals and measure them. Loop
   one output into one input using the included SMA cables and T-adapters (the
   kit comes with exactly this). Test the oscilloscope, signal generator,
   spectrum analyzer, and Bode plotter. Document accuracy vs. the stated specs
   (14-bit resolution, ±1V range, 60 MHz BW). This alone is solid review
   content and the practical approach — connect the board, run code, look at
   signals, change things, and see what happens — is what distinguishes a good
   Red Pitaya review from a spec sheet repeat. Elektor Magazine

2. **Self-loopback characterisation**

   Connect OUT1 → IN1 directly. Generate a known sine wave and sweep it from 1
   kHz to 60 MHz. Plot the amplitude response using the Bode analyzer app. This
   directly validates the advertised DC–60 MHz bandwidth claim and is a test
   any reviewer can do without external equipment.

3. **QSPI eMMC module — storage performance**

   You're getting this as an included extra. Boot from eMMC vs. microSD and
   compare: boot time, sequential read/write speed (use dd or fio from the
   Linux shell), and stability. This is actually a gap in existing reviews —
   most Red Pitaya coverage ignores the storage subsystem entirely.

### Tier 2 — Maker-friendly projects

4. **Python API exploration via Jupyter**

   Jupyter notebooks enable beginners to learn how to start programming the Red
   Pitaya board in 5 minutes. Use the built-in Jupyter environment to script
   the signal generator and oscilloscope. A practical demo: write a script that
   sweeps output frequency and logs peak amplitude from the ADC — essentially a
   software Bode plotter you built yourself. This is meaningful because it
   shows the programmability story, which is one of the key differentiators vs.
   a fixed-function scope. Red Pitaya

5. **PWM audio signal analysis**

   Using the Red Pitaya as a spectrum analyzer to study a PWM-modulated audio
   signal is a practical real-world test — PWM audio modulation is the basis of
   Class-D amplifiers, widely used in consumer electronics. You could generate
   a PWM signal from an Arduino or ESP32 (which you likely have in your maker
   kit) and use the Red Pitaya's spectrum analyzer to observe the carrier
   frequency and harmonics. This tests the spectrum analyzer against a known,
   predictable signal structure. Controlpaths

6. **Logic analyzer + protocol decode**

   The extension connector gives you 16 digital IOs. Wire up a cheap I2C sensor
   (temperature, pressure — whatever you have) to the extension pins, then use
   the logic analyzer app to capture signals and decode protocols like I2C,
   SPI, or UART. Compare the Red Pitaya's decode output against what you'd
   expect from the sensor datasheet. This is a great test of the digital side
   that most radio-focused reviews skip entirely. Red Pitaya

7. **LCR meter validation**

   Use a selection of known passives from your parts bin (resistors,
   capacitors, inductors) and measure them with the LCR meter app. Cross-check
   against a multimeter or component datasheet tolerances. This is simple,
   reproducible, and directly answers "is this actually useful as a bench
   instrument?"

### Tier 3 — Stretch / SDR-light (beginner accessible)

8. **FM broadcast reception (SDR intro)**

   This is the classic SDR beginner project, and it works well with the Red
   Pitaya. The Red Pitaya in SDR mode can receive signals from 0 to 50 MHz with
   up to 2.5 MHz bandwidth, and is compatible with SDR software like SDR# and
   HDSDR. FM broadcast in Australia is 87.5–108 MHz — outside the hardware
   range — but AM broadcast (531–1602 kHz) and shortwave are well within it. A
   simple wire antenna clipped to an SMA adapter is enough to receive shortwave
   broadcasts or amateur radio signals. No licence needed to receive. RTL-SDR

9. **Spectrum monitoring — RF environment survey**

   Use the spectrum analyzer app to do a survey of your local RF environment
   from DC to 60 MHz. Document what you find (AM broadcast, amateur bands,
   power line noise, etc.). This is a useful, original piece of content for a
   review because it's location-specific — nobody else will have done it from
   Melbourne. It also honestly demonstrates the noise floor and dynamic range
   of the hardware.

