---
layout: post
title: "element13 Foil Headwave Aluminium aTtenuator DevKit"
date: 2026-06-23 17:00:00 +1100
categories: element14, road-test
---

## The Package Arrives

There are road tests, and then there are _road tests_. When element14's April
1st offering landed in my inbox — the **element13 Foil Headwave Aluminium
aTtenuator DevKit** — I was, naturally, all in. Element 13 on the periodic table
is aluminium. I should have known.

<video width="740" controls>
  <source src="/learning/assets/2026-06-23/al_foil_unboxing.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

The kids' faces said it all. There is a special kind of disappointment when you
have built up "electronics delivery" energy and the box contains thirty pre-cut
sheets of kitchen foil. Was the foil _packaging_ something? No. The foil _was_
the thing.

Still — a devkit is a devkit. I decided to take the brief seriously, pulled out
some lab equipment and a Jupyter notebook, and went to work.

## What Did We Actually Receive?

Thirty sheets of aluminium foil, pre-cut to a consistent size. First
observation: the cutting is genuinely precise. All five sheets I measured came
in at **299×273 mm ±0.25 mm** — better tolerance than most craft cutters manage.
Whatever tooling produced these, it is not scissors. I think this had a level
of novelty for me, as I am used to rolls of aluminium foil and having to cut
them myself.

![](/learning/assets/2026-06-23/al_foil_attenuator_foil.jpg)

Oh and there were stickers - I was so excited about the foil, I forgot to put
the stickers in the shot

![](/learning/assets/2026-06-23/al_foil_lenght.jpg)

## Material Characterisation

### Thickness: A Tale of Three Methods

The nominal spec for Aluminium foil is a thickness of 16 µm. I tried three
approaches to verify this.

**Released caliper jaw (20-layer stack, 6 sections):** 15.0–19.5 µm per sheet,
mean 17.6 µm. Too high — air gaps between the stacked layers inflate the
reading.

**Firm caliper press (same stack):** 10.5–13.5 µm per sheet, mean 12.1 µm. Too
low — cheap digital calipers might flex under some jaw force, pulling the
reading down.

![](/learning/assets/2026-06-23/al_foil_thickness.jpg)

The two failure modes bracket the truth from opposite sides, which is itself a
useful result.

**Mass method — five sheets, two weighings each, three bundle weighings:**

| method          | mass/sheet |    thickness |        Δ from nominal |
| --------------- | ---------: | -----------: | --------------------: |
| individual mean |    3.160 g |     14.34 µm |              −1.66 µm |
| bundle mean     |    3.157 g | **14.32 µm** | **−1.68 µm (−10.5%)** |

**The foil is 14.32 µm — 10.5% thinner than the 16 µm nominal predicted.**

The mass method has no air-gap or frame-flex problem. Uncertainty is dominated
by the ruler measurement of sheet area (`±0.25 mm` on `299 mm ≈ 0.17%`), giving
thickness uncertainty of `±0.02 µm`. The caliper method, by contrast, had `±4.5
µm` spread from air gaps alone.

![](/learning/assets/2026-06-23/al_foil_weight.jpg)

_Lesson: for thin compressible stacks, weigh them — don't measure them._

### Tensile Strength

A `10 mm` wide strip, tape-reinforced at each end, hung from a fixed point with
a cup of water added incrementally until failure. Three trials:

|    trial |      failure load |                UTS |
| -------: | ----------------: | -----------------: |
|        1 |             997 g |           68.3 MPa |
|        2 |           1,004 g |           68.7 MPa |
|        3 |           1,010 g |           69.1 MPa |
| **mean** | **1,004 g ± 6 g** | **68.8 ± 0.4 MPa** |

Only `12.6 g` spread across three trials — `1.3%` variation. The mean UTS
(Ultimate Tensile Strenght) of **68.8 MPa** is below the `~80 MPa` often quoted
for aluminium foil; that figure assumes work-hardened material. This product is
clearly **O-temper** (fully annealed), standard for kitchen foil: softer, more
foldable, 65–75 MPa typical. The ±0.4 MPa standard deviation confirms very
uniform material throughout the roll.

## HCl Dissolution

<video width="740" controls>
  <source src="/learning/assets/2026-06-23/al_foil_acid_runaway_reaction.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

Hardware-store muriatic acid, diluted `1:3` in water. A half-sheet piece (`1.58
g`) dropped into a tared beaker. Mass tracked every `30 seconds` as `H₂`
escapes.

Reaction: `2Al + 6HCl → 2AlCl₃ + 3H₂↑`
Stoichiometry shortcut: Al dissolved (g) = H₂ lost (g) × 9

**Phase 1 — cold outdoor conditions, undisturbed:**

- 74% of the foil dissolved in **9.4 minutes**
- Rate slowed because part of the foil was sitting above the liquid line

The interesting result came when I added more acid, impatient with the
remaining 26%. The exothermic reaction had already warmed the solution
slightly; fresh acid tipped it into **thermal runaway**. Rate jumped from
`~0.01 g/min` to `>0.5 g/min` over two minutes; the solution heated visibly and
fumed. Of the `5.5 g` total mass lost in Phase 3, only `~0.046 g` was `H₂` from
the remaining aluminium — the other `5.5 g` was **HCl vapour and water
evaporating from the hot solution**.

This autocatalytic loop

```
cold start → slow reaction → exothermic heat → faster reaction → more heat
```

is a neat demonstration of why temperature control matters in wet chemistry, and
why you do this outdoors with safety glasses. It also explains why two of my
three attempts were too vigorous to measure cleanly.

TIP: _For a clean kinetics curve: smaller piece (~0.4 g), larger volume (~150
mL), room temperature. Should complete in 3–5 minutes with no runaway._

## RF Attenuation — 433 MHz

A continuous-carrier 433 MHz transmitter (FS1000A module, DATA pin held HIGH —
a two-line Arduino sketch), the TinySA Ultra as receiver, fixed 30 cm apart
with foil layers added one at a time.

![](/learning/assets/2026-06-23/rf_radio_side.jpg)
![](/learning/assets/2026-06-23/rf_setup_overview.jpg)
![](/learning/assets/2026-06-23/rf_tiny_sa_side.jpg)

```c
void setup() {
    Serial.begin(115200);
    pinMode(TX_PIN, OUTPUT);
    digitalWrite(TX_PIN, HIGH);
    Serial.println(F("433 MHz TX | continuous carrier ON"));
    Serial.print(F("DATA pin ")); Serial.print(TX_PIN); Serial.println(F(" HIGH"));
}
```

The theoretical basis: skin depth of aluminium at `433 MHz` is **3.94 µm**. The
foil is `14.32 µm` thick — **3.6 skin depths** — which the plane-wave
skin-depth model predicts gives **31.6 dB attenuation per layer**. A single
sheet should be close to opaque.

**Measured results — 24 layers, 30 cm indoor, TinySA Ultra:**

| layers |   dBm |  attenuation |
| -----: | ----: | -----------: |
|      0 | −33.9 |         0 dB |
|      1 | −38.9 |      −5.0 dB |
|      5 | −40.4 |      −6.5 dB |
|     10 | −44.4 |     −10.5 dB |
|     15 | −52.4 |     −18.5 dB |
|     20 | −58.9 |     −25.0 dB |
|     24 | −63.9 | **−30.0 dB** |

The measured slope is approximately **−1.25 dB/layer** — about **25× less**
than the theoretical 31.6 dB/layer. The result is real and reproducible, but
the discrepancy needs explaining.

![](/learning/assets/2026-06-23/rf_top_down.jpg)

**Why so much less than theory?** Three effects combine:

1. **Fresnel diffraction** — at 433 MHz (λ = 69 cm), the first Fresnel zone at
   the midpoint of a 30 cm path has radius ~23 cm. The foil is 27 cm wide, so
   it covers only ~36% of that zone; signal diffracts around the exposed outer
   ring.

2. **Room multipath** — signal reflects off walls, ceiling, floor, and nearby
   objects. These indirect paths arrive at the TinySA from angles the foil does
   not block. Only the direct path is attenuated.

3. **Near-field geometry** — at 30 cm = λ/2 the coupling is partly near-field
   rather than a clean plane wave, making the simple skin-depth model a poor
   approximation.

Despite the reduced per-layer efficiency, the experiment still shows a clear
and measurable 30 dB total attenuation over 24 layers. The foil works; the
indoor setup just can't isolate the direct path cleanly. Outdoors at 3–5 m with
the Fresnel zone properly covered, each layer would approach the theoretical
value.

## Summary

What element14 sent me was, let's be honest, a pack of kitchen foil. But not
_just_ kitchen foil:

- **Precisely cut** to 299×273 mm, consistent to ±0.25 mm across 30 sheets
- **14.32 µm actual thickness** — 10.5% thinner than the 16 µm nominal, but
  remarkably uniform
- **O-temper aluminium** — UTS 68.8 MPa, soft, annealed, consistent to 1.3%
  across trials
- **Dissolves in dilute HCl** with an entertaining exothermic finale if you are
  not careful
- **30 dB total attenuation at 433 MHz** — measured over 24 layers indoors;
  theory predicts 31.6 dB for a single layer, but multipath and Fresnel
  diffraction reduce the effective per-layer result to ~1.25 dB in a real room

The tongue-in-cheek devkit framing holds up better than expected. The material
is genuinely well-characterised, the cutting is precise, and the
electromagnetic properties are real.

I note that you cannot seem to be able to get the same DevKit on the element14
website anymore, but the same dimentions and texture can be bought from:
- [https://www.elpack.co.uk/shop/aluminium-foil-sheets-pack-of-500/](
  https://www.elpack.co.uk/shop/aluminium-foil-sheets-pack-of-500/)

  ![](/learning/assets/2026-06-23/al_foil_online_store.png)

## Future Work

- **2.4 GHz** (nRF24L01, Zigbee) — shorter wavelength, even thinner skin depth;
  expect attenuation in fewer layers
- **mmWave radar** — at `24/60/77 GHz` the skin depth drops to `~0.3–0.5 µm`;
  the `14.32 µm` foil is 28–48 skin depths thick and acts as a near-perfect
  reflector rather than an absorber; interesting to verify with the mmWave
  sensor whether a single sheet registers as a hard target, and whether
  crumpling the foil changes the radar cross-section — a flat sheet is a
  specular reflector (strong return only at normal incidence) while a crumpled
  sheet scatters in all directions.
- **DIY parallel-plate capacitor** — two full sheets + baking paper dielectric →
  measure capacitance → compute `ε₀` → derive the speed of light from
  ```
  c = 1/√(ε₀μ₀)
  ```
  The April Fools devkit that became a Maxwell electromagnetism experiment.

---

_All data, calculations and plots in the accompanying
[Jupyter notebook](https://github.com/saramic/learning/tree/master/competitions/20260401_e14_road-test_al_foil)._
