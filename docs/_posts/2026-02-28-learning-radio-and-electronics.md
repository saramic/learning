---
layout: post
title:  "Learning radio and electronics"
date:   2026-02-28 18:00:00 +1100
categories: Radio, electronics
---

# Plan for learning radio and electronics

_TODO WIP ... _

internal notes https://chatgpt.com/c/69755ac5-efc8-8322-87a2-9059b38c0d55

Ground rules (do these first)

- Know what you’re allowed to transmit on. If you don’t have a ham license,
  keep TX experiments to legal services (CB, LPD/FRS/UHF CB where applicable)
  and follow power/antenna rules.
- Start with receive-only. You can learn tons without transmitting.
- Keep distances small at first (near-field), low power, and avoid long “random
  wires” near power lines.
- Build a “test transmitter” plan: either
    - an existing legal handheld/CB, or
    - a low-power signal source (later: NanoVNA output, tiny oscillator, or a
      licensed low-power transmitter).

## Phase 1 — “I can detect RF” (no fancy tools)

### Experiment 1: Simple pickup loop + detector (the article idea)

**Goal:** See a measurable voltage when a nearby radio transmits.

**Build:**

Loop: 5–20 turns of wire on a cardboard form (5–15 cm diameter).

Detector: Schottky diode (e.g., 1N5711 or BAT43) + RC (say 10 nF + 100 kΩ) to
make a simple envelope detector.

Load: measure DC across the capacitor with a multimeter.

**What you learn:**

Strong near-field coupling

Orientation matters (rotate loop, voltage peaks/nulls)

Distance falloff (roughly fast in near-field)

Safety/notes:

A “nearby transmitting radio” can produce surprisingly high RF near the
antenna—don’t touch the transmitting antenna.

### Experiment 2: Resonant loop “tunes louder”

**Goal:** Add a capacitor to resonate the loop at a frequency and watch the
detected voltage peak.

**Build:**

Same loop, add a variable capacitor (or fixed caps you can swap).

Keep the same diode detector.

**What you learn:**

Resonance is real and sharp-ish

Q factor, bandwidth, detuning by your hand nearby

### Experiment 3: “Human body detunes antennas”

**Goal:** Quantify hand proximity effects.

Measure detected output while moving your hand near the loop.

Try different loop sizes, turns, and capacitor values.

Phase 2 — Add NanoVNA early (it’s the best teacher)

Once you can “see” RF with the detector, add measurement.

### Experiment 4: Measure resonance and impedance with NanoVNA

**Goal:** See your loop’s resonance on a plot.

Do:

Connect loop (with tuning cap) to NanoVNA.

Sweep around target frequency.

Look at S11 return loss, Smith chart, and resonant dip.

**What you learn:**

Resonance frequency shifts with geometry and environment

Matching and impedance are not abstract concepts anymore

Tip: build a couple of simple calibration standards habits (do the NanoVNA SOL
calibration at the end of your test cable).

### Experiment 5: Build a basic RF “field probe”

**Goal:** Turn your pickup loop into a repeatable “RF strength” sensor.

Small loop + diode detector + resistor load

Use the NanoVNA or a known TX as the source

Mark distances and compare relative readings

## Phase 3 — Wire antennas you can build in 20 minutes

### Experiment 6: Random wire + counterpoise (receive-only first)

**Goal:** Compare “just wire” vs “wire + counterpoise”.

**Build:**

3–10 m wire as antenna

3–10 m wire as counterpoise (or a few radials on the ground)

Simple LC tuner (optional) or directly into a receiver / NanoVNA

**Learn:**

The “other half” of the antenna matters

Noise pickup changes dramatically with counterpoise/grounding

### Experiment 7: Half-wave dipole (the baseline)

**Goal:** Build a reference antenna you can compare everything against.

**Build:**

Cut for a band you can legally test on (or receive-only).

Make a 1:1 choke balun (simple: several turns of coax on a form).

Measure with NanoVNA: resonance, SWR, bandwidth.

**Learn:**

How height and surroundings shift resonance

Why choke/balun reduces common-mode mess

## Phase 4 — Matching networks & feedlines (where “RF” starts feeling real)

### Experiment 8: Build a simple L-match / tuner

**Goal:** Match a non-50 Ω antenna to 50 Ω.

**Build:**

One inductor + one capacitor (var cap helps)

Use NanoVNA to watch match improve in real time

**Learn:**

What “matching” actually does (and does not do)

Loss, Q, and how narrowband matching can be

### Experiment 9: Transmission line experiments

**Goal:** Understand coax length, velocity factor, and impedance transforms.

**Do:**

Use NanoVNA to measure a coax stub and see phase delay

Try open/short stubs and observe impedance swings on Smith chart

## Phase 5 — Directionality: multi-element & arrays

### Experiment 10: Two-element array (receive is easiest)

**Goal:** Make directionality with two simple elements.

Options:

Two small loops separated by 0.1–0.3 wavelength (or smaller, even)

Or two short verticals with a simple combiner

Try:

Combine in-phase vs out-of-phase (even manually swapping leads)

Observe nulls and peaks by rotating the setup or moving the source

**Learn:**

Phase creates steering/nulls

The environment matters a lot

### Experiment 11: Yagi basics (VHF is much easier than HF)

**Goal:** Build a small Yagi you can actually manage on a bench.

Pick an easy band:

Something like 2 m (144 MHz) if you’re licensed, or receive-only

Build a 3-element Yagi from tape measure steel or aluminum rod

Use NanoVNA for feedpoint match

**Learn:**

Director/reflector tuning and spacing effects

Front-to-back ratio, pattern shaping

## Phase 6 — NanoSA & “what’s in the air?”

### Experiment 12: Spectrum surveying (NanoSA)

**Goal:** Observe real signals and your own sources.

**Do:**

Use a tiny pickup antenna on NanoSA

Compare noise floor with different antennas, indoors/outdoors

Observe how switching antennas changes signal strength and noise

**Learn:**

Your antenna is also a noise sensor

Receive performance is often limited by local noise, not antenna gain

## Phase 7 — ESP32-controlled antenna switching & combining

### Experiment 13: Simple antenna switch box

**Goal:** Select among antennas cleanly and repeatably.

Build:

ESP32 + I²C GPIO expander (or direct pins)

RF relays (or relay modules for HF receive-only; better: RF relays)

Control multiple antennas into one receiver

Learn:

Repeatable A/B comparisons

How to avoid coupling and leakage

### Experiment 14: Two-channel coherent SDR + DSP (advanced but awesome)

Goal: Actually combine antennas (beamforming / noise cancel / diversity).

For true combining, you need two simultaneous, phase-coherent receive channels
(many cheap SDRs aren’t coherent unless designed for it).

Do:

Two antennas into coherent SDR channels

Implement:

Equal-gain combining (phase align + sum)

Maximal ratio combining (weight by SNR)

Adaptive noise cancellation (LMS filter using a “noise antenna”)

Learn:

Why phase coherence matters

Practical beam steering and nulling

(ESP32 can do switching and control, but the math usually runs on a PC/SBC.)

A good “starter kit” list (minimal but powerful)

Wire, ferrite cores, coax + connectors

Schottky diode + caps/resistors for detector probes

NanoVNA (for S11/impedance)

NanoSA (for spectrum “what changed?” checks)

A known signal source (legal TX, or later a small oscillator / VNA output)

Notebook + repeatable test setup (same location/height each time)

If you want a super practical 1-week plan

- Day 1: pickup loop + diode detector; measure vs distance/orientation
- Day 2: resonant loop with capacitor; find peak; observe hand detune
- Day 3: NanoVNA: measure loop resonance and dipole resonance
- Day 4: build dipole + choke; measure height/environment changes
- Day 5: build L-match; match something “bad” to 50 Ω
- Day 6: two-antenna A/B switch; measure noise + signal differences
- Day 7: build directional (small loop nulling or simple 2-element)

If you tell me roughly what bands you’re aiming for (e.g., 27 MHz CB, HF ham,
VHF/UHF), I’ll tailor the exact dimensions (loop size/turns, dipole lengths,
spacing) and a simple measurement worksheet so each experiment produces clear
“before/after” results.

---

## Option A: Pivot toward a metal detector

A metal detector is basically near-field electromagnetics + sensing + DSP, not
far-field radio. That’s great because it’s easier to do controlled experiments.

Two good project “tracks”
1) VLF induction-balance (classic hobby detector)

Idea: Transmit a steady sinusoid (often ~5–20 kHz) into a TX coil. A nearby RX
coil is arranged so the direct coupling cancels (“balanced”). Metal nearby
changes the field → imbalance → measurable signal.

What you build

Coils: TX + RX (often overlapping “DD” coils or concentric coils), plus a rigid mount.

Analog front-end: low-noise amplifier for RX, notch/balance trim, bandpass filter.

DSP (ESP32 is enough here):

Generate a clean sine (DAC or PWM + filter)

Synchronous detection (lock-in / I/Q demod): multiply RX by sin/cos reference,
low-pass → you get I and Q

Use phase (Q vs I) to distinguish ferrous/non-ferrous tendencies and amplitude
for strength/depth-ish

Auto ground-balance (slowly adapt the DC offsets of I/Q)

Why it’s a great final

It’s very “signal processing”: lock-in detection, adaptive filtering, classification.

Clear demo: find coins, distinguish materials, show depth curves.

2) Pulse Induction (PI) detector (excellent “DSP & timing” project)

Idea: Blast a coil with current pulses, then listen to the decay. Metal changes
the decay curve.

What you build

Power stage: MOSFET switch, current pulse into coil

RX window: after the pulse, measure coil ring-down / decay at precise times

DSP:

Sample at fixed delays (“time gates”)

Average many pulses (coherent averaging) to boost SNR

Fit decay constants or compare gate ratios for target ID

Why it’s compelling

Looks “serious engineering”: power electronics + precise sampling + averaging.

Very visible improvements from DSP (stacking/averaging).

Which is easier?
VLF induction-balance is generally simpler and quieter electrically. PI is
awesome but more “power switching noise / layout discipline.”

## Option B: Antennas separated by km and combine data over the internet (faint cosmic signals)

What you’re describing is basically radio interferometry, and in the extreme
case VLBI (Very Long Baseline Interferometry): multiple receivers far apart,
each timestamping samples using precise clocks, then later correlating the
recordings to extract faint sky signals.

A realistic “student final” version (doable without a radio observatory budget)
Step 1: Choose an easy signal target

Cosmic signals are real but hard. Pick one of these levels:

Level 1 (easiest demo): correlate a known transmitter (a beacon you can legally
use, or a satellite) across two sites. Proves the method.

Level 2: correlate strong natural sources:

The Sun (radio noise bursts / broadband emission) is the most approachable
natural source.

The Milky Way background is possible at some frequencies but needs good
receivers/antennas and low noise.

Level 3 (hard): hydrogen line (1420 MHz) or pulsars—possible, but it’s a bigger
telescope/receiver problem.

Step 2: Hardware per site

Antenna (directional helps), LNA if needed, bandpass filter

SDR that can stream raw I/Q (lots of options)

A GPS-disciplined oscillator (GPSDO) or at least a stable reference clock input

A way to timestamp samples:

Ideally: sample clock locked to GPSDO and timestamps derived from 1PPS

Or: record I/Q continuously and align later using cross-correlation (works if
drift isn’t too wild)

Step 3: Data pipeline

Raw I/Q data rates get big quickly:

Example: 2 Msps complex, 8-bit I+Q → ~4 MB/s → ~14 GB/hour per site.
So you usually:

Record locally (fast SSD)

Upload subsets or ship drives

Or reduce bandwidth (narrowband channelize first)

Step 4: The core DSP: correlation

You’ll build an “FX correlator” style pipeline:

F stage: FFT channelization into frequency bins

X stage: cross-multiply spectra between sites and integrate

Peak appears when you apply the correct time delay and fringe rate corrections
(Earth rotation causes phase to wind)

Even a simpler time-domain cross-correlation works for narrowband demo signals.

Step 5: Why atomic clocks / GPS matter

For km baselines, the killer is time and phase coherence:

To correlate faint signals, you need to know the relative timing to within a
small fraction of the sample period and keep clocks from drifting.

GPS gives you:

1PPS timing

A disciplined frequency reference (GPSDO)

True “atomic clock” quality isn’t required at km scale for a demo, but
stability helps a lot.

What’s the “benefit” of the km separation?

With multiple antennas separated by baseline B, you effectively get angular
resolution like a telescope of diameter ~B.

You trade “one big dish” for “many smaller dishes + math.”

The honest difficulty

Building a proof of concept interferometer is very doable. Detecting really
faint cosmic sources is where receiver noise, RFI, calibration, and antenna
design become the main battle.

How to scope a final project so it actually finishes
If you want something you can demo reliably:

Metal detector (VLF or PI) is the best “guaranteed win”:

Controlled environment

Strong signals

Clear performance metrics

If you want something that screams “radio astronomy / advanced DSP”:

Do a two-site correlator with a known signal, and optionally show a natural
target (Sun) as a stretch goal.

A very clean project statement could be:

“Build a two-node, GPS-disciplined SDR system and implement cross-correlation
to estimate time delay / direction-of-arrival, demonstrating interferometry
principles.”

Pick your adventure (no more questions needed—here are two ready-to-run project
outlines)

### Final A (Metal detector, DSP-heavy)

Build TX/RX coils + analog front end

Implement lock-in I/Q demod on ESP32

Add auto ground balance + target classification (phase/amplitude features)

Quantify detection depth vs coil size and frequency

Final B (Distributed antennas, internet correlation)

Two SDR stations km apart

GPSDO + 1PPS disciplined capture

Record I/Q, upload, correlate (FFT → cross-power spectrum)

Demonstrate delay estimation and “beam”/direction inference for a known signal; stretch: Sun

If you tell me which direction you’re leaning (metal detector vs distributed
interferometry), I’ll turn it into a concrete build plan with block diagrams,
parts lists at “hobby budget” level, and a week-by-week test checklist.

---

8 simple transistor circuits (build these first)
Circuit 1 — NPN low-side LED switch (transistor as a switch)

Use: any general NPN (2N2222/2N3904/BC547/etc.)

VCC = 5–12 V

LED + RLED from VCC to collector

Emitter to GND

Base via RB = 4.7k–22k from MCU/switch

Add 100k base-to-GND to keep it off

RLED:

5 V: 330–1k

9–12 V: 1k–3.3k

Circuit 2 — PNP high-side switch (turn loads on from the “top”)

Use: any general PNP (2N3906/A1015/BC557/etc.)

Emitter to VCC

Collector to load → then to GND

Base via RB = 4.7k–22k to a control signal that can pull the base down

Add 100k base-to-VCC to keep it off

Tip: easiest control is an NPN transistor pulling the PNP base down (two-transistor high-side driver).

Circuit 3 — Two-transistor astable LED flasher (classic)

Use: 2× NPN (or 2× PNP, mirrored)

Two NPNs cross-coupled with caps.

For each side:

Collector resistor RC = 1k–4.7k to VCC (LED can be in series here)

Base resistor RB = 47k–220k to VCC

Coupling capacitor C = 1µF–10µF from opposite collector to base

Blink rate scales with RB × C.

Circuit 4 — One-transistor audio preamp (common-emitter)

Use: low-noise-ish small-signal NPN (BC549/BC550/2N3904/C1815/etc.)

VCC: 9 V (works 5–12 V with tweaks)

Bias: R1 = 100k (VCC→base), R2 = 22k (base→GND)

RE = 1k (emitter→GND) + optional bypass CE = 47µF for more gain

RC = 4.7k (collector→VCC)

Input cap Cin = 100nF–1µF into base

Output cap Cout = 1µF–10µF from collector to next stage

This is a great “learn transistor gain/bias” circuit.

Circuit 5 — Emitter follower buffer (voltage follower)

Use: any NPN (or PNP inverted)

Collector to VCC

Base = input via 1k–10k

Emitter = output

Add RE = 1k–10k from emitter to GND (sets bias/load)

Use it to buffer a sensor/pot into something higher load.

Circuit 6 — Constant current sink (simple LED driver / bias source)

Use: any NPN; BC517 makes it easy for tiny base currents

Put a reference on base (e.g., 2× diode drops or a small trimpot divider)

Emitter resistor RE sets current:



Example: set base ≈ 1.3 V with two diodes → with RE=68Ω gives ~9 mA.

Circuit 7 — Simple transistor “logic”: inverter + Schmitt-ish trigger

Use: any NPN

NPN inverter: collector resistor 10k to VCC, emitter to GND, output at collector, input through 10k to base, plus 100k base-to-GND.

Add positive feedback (470k–1M from collector to base) to create hysteresis (Schmitt-ish) for clean switching from slow signals.

Circuit 8 — RF “sniffer” / field-strength probe (receiver-ish, very simple)

Use: fast-ish NPNs like 2N3904 / BC547 / BC337 work fine for a probe

Make a tiny pickup loop (1–3 turns, 1–2 cm diameter) into a diode detector OR transistor detector.

Easiest version:

Loop → 1N4148 (or Schottky if you have) → 10nF to GND → meter input

“Transistorized” boost:

Loop into base via 10pF–100pF, bias base lightly (1M to GND), use Circuit 4-ish but with small caps.
This won’t be calibrated, but it’s great for “is it transmitting?” and comparing antennas.

(If you later transmit, keep it legal for your region/band.)

Which transistors to use for what (a few circuits each)

I’m grouping by what they’re best at, but I’ll still list every part you showed.

General-purpose NPN (great starters)

2N2222, 2N3904, C945, C1815, S9013, S9014, S9015, BC547, BC548, BC337, S8050, BC517

Good circuits: 1 (switch), 3 (flasher), 5 (buffer), 7 (logic)

Also good: 4 (audio preamp) for the “quieter” ones (BC547/548/549/550, 2N3904, C1815)

Notes:

2N2222 / BC337 / S8050: generally happier with a bit more current (switching
small relays, brighter LEDs) → circuits 1, 3, 6, 7

BC517 (Darlington NPN): very high gain → excellent for 6 (constant current) and
driving loads with tiny base current in 1. Not ideal for RF.

“Low-noise / small-signal” NPN (nice for amplifiers)

BC549, BC550

Good circuits: 4 (audio preamp), 5 (buffer), 7 (Schmitt-ish)

Also fine for 1/3, but you’ll mainly enjoy them in amplifier roles.

Higher-voltage NPN

2N5551

Good circuits: 4 (preamp at higher supply), 7 (logic at higher supply), 6 (current sink)

Use it when you want to play with 12–30 V supplies more comfortably than some of the others.

General-purpose PNP (great starters)

2N3906, A1015, S8550, S9012, BC327, BC556, BC557, BC558

Good circuits: 2 (high-side switch), 3 (flasher mirrored as PNP), 5 (PNP follower inverted)

Notes:

S8550 / BC327: often better for higher current PNP switching → circuits 2, 3

BC556/557/558: great for small-signal biasing and amplifier pairs (e.g., complementary stages later).

Higher-voltage PNP

2N5401

Good circuits: 2 (high-side at higher supply), 6 (current source style), and
complementary amplifier experiments with 2N5551.

What I’d build first (fastest learning curve)

Circuit 1 with 2N2222 (LED switch)

Circuit 3 with 2× 2N3904 (blinker)

Circuit 4 with BC549/BC550 (audio preamp)

Circuit 2 with 2N3906 (high-side switch)

Circuit 7 with BC547 (clean digital switching)

Circuit 6 with BC517 (constant current)
