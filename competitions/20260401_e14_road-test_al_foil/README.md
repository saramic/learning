# April 1 E14 Al foil devKit

- [Engineers needed to review the element13 Foil Headwave Aluminium aTtenuator DevKit](
  https://community.element14.com/products/roadtest/rt/roadtests/712/engineers_needed_to_review_the_element13_foil_headwave_aluminium_attenuator_devkit)

## Original entry

> # Adaptive EMI Suppression Wrap (AESW) – Developer Evaluation Kit
>
> A rapid-deployment electromagnetic interference mitigation platform built on
> precision-configured aluminium shielding layers. Designed for engineers
> needing immediate, field-adjustable EMI suppression without full enclosure
> redesign.
>
> ## Core Technology
>
> The AESW utilizes a multilayer aTtenuator DevKit stack acting as a
> configurable Faraday barrier, combined with distributed grounding nodes to
> shunt unwanted RF energy away from sensitive circuitry.
>
> ## Key Features
>
> * Broadband EMI Attenuation: Effective suppression across common interference
>   bands (Wi-Fi, LTE, “mystery lab noise”) via continuous conductive shielding
> * Configurable Ground Reference Network: Optional clip-on grounding lead
>   enables users to transition from passive reflection mode to active
>   interference dissipation
> * Fold-Tuned Resonance Control: Adjustable geometry allows users to “tune”
>   attenuation characteristics by modifying effective surface area and
>   coupling
> * Near-Field Noise Reduction Mode: Wrap-and-ground configuration reduces
>   inductive and capacitive coupling into high-impedance nodes
> * Retrofit Friendly: Integrates with existing prototypes without PCB redesign
>   (no soldering required—usually)
>
> ## Optional Expansion Module
>
> * Active Noise Cancellation Node (Beta):
>   A simple op-amp-based circuit samples ambient interference via a probe loop
>   and injects an inverted signal into ground reference, creating the
>   impression of active EMI cancellation (results may vary depending on
>   physics).
>
> ![](assets/AdaptiveEMIsuppressionwrapblueprint.png)

## Possible extensions

- how consistent is the thickness to 16µm
- will the breaking strain match my expectations of

  `≈ 80 MPa × 4.8mm² = ~384N (~39kg)`

  across full width
- what is the scoring threshold (1–5N)
- chemical decomposition
- and finally can it make a reasonable capacitor

```
C = ε₀ × (A / d)

ε₀ = 8.854 × 10⁻¹² F/m
A  = plate overlap area (m²)
d  = plate separation (m)
```

## Mega extension - Maxwell's Speed of Light Calculation

The expression
```
1/√(ε₀μ₀)
```
is Maxwell's remarkable discovery that the speed of light can be derived purely
from electrostatic and magnetic measurements — no optical equipment needed.

- `ε₀` (permittivity of free space) — how strongly electric fields form in a
  vacuum; relates charge to force
- `μ₀` (permeability of free space) — how strongly magnetic fields form;
  relates current to force
- Together they encode how fast electromagnetic disturbances propagate — which
  turns out to be `c`

### DIY backyard experiment

You don't need to measure `μ₀` (it's defined exactly as `4π×10⁻⁷`). So your
task reduces to measuring `ε₀` experimentally using a homemade capacitor, then
computing `c`.

**The Strategy**

A parallel plate capacitor has capacitance:
```
C = ε₀ × (A / d)
```
So: `ε₀ = C × d / A`
Measure `C`, `d`, and `A` → compute `ε₀` → plug into `1/√(ε₀μ₀)` → get `c`.

**Building the Capacitor**

Materials

- Aluminium foil (two identical sheets)
- Baking paper or thin plastic bags as dielectric (or just air gap)
- Ruler + vernier calipers if available
- Heavy books to press plates flat
- Cardboard backing for rigidity

Construction

- [Foil plate A]  ← connect wire here
- [Baking paper]  ← dielectric (or air)
- [Foil plate B]  ← connect wire here
- [Cardboard backing]
- Critical dimensions to maximise C (you want a measurable value):

- Make plates at least 40×40 cm — bigger is better
- Dielectric thickness: a single sheet of baking paper (~0.05–0.08 mm) gives you
  more capacitance than an air gap
- Press flat under heavy books — any gap variation kills accuracy

Measure carefully:

A = plate area in m² (measure foil precisely, they must be identical)
d = dielectric thickness in metres — stack 20 sheets, measure with calipers,
    divide by 20

Measuring Capacitance

Option A — Arduino (RC timing method)

This is the most satisfying approach. You measure how long a known resistor
takes to charge the capacitor to 63.2% of supply voltage (one RC time constant
τ = RC).
```
5V ──[10MΩ resistor]──┬── Arduino digital pin (reads voltage via analogRead)
                      │
                   [your cap]
                      │
                     GND
```
Sketch:
```cpp
cppconst int CHARGE_PIN = 7;    // drives 5V through resistor
const int READ_PIN   = A0;   // reads voltage on capacitor
const float R        = 10e6; // 10 MΩ — use large R for small C

void setup() {
  Serial.begin(9600);
}

void loop() {
  // Discharge first
  pinMode(CHARGE_PIN, OUTPUT);
  digitalWrite(CHARGE_PIN, LOW);
  delay(5000); // let it fully discharge

  // Start charging, time to 63.2% (analog value ~648 out of 1023)
  unsigned long startTime = micros();
  digitalWrite(CHARGE_PIN, HIGH);

  while (analogRead(READ_PIN) < 648) {
    // waiting for 63.2% of 5V
  }

  unsigned long tau = micros() - startTime;

  float C = (float)tau / R; // C = τ / R in Farads
  Serial.print("tau (us): "); Serial.println(tau);
  Serial.print("C (pF):   "); Serial.println(C * 1e12);
  delay(10000);
}
```

⚠️ Arduino analogRead has ~10kΩ internal impedance — use R ≥ 1MΩ so this error
is <1%. With baking paper dielectric your C will be ~200–800 pF, giving τ in
the range of milliseconds with 1MΩ — well within micros() resolution.

Resistor tip: Use a measured resistance. Cheap 10MΩ resistors can be ±5% —
measure yours with a multimeter first and use the actual value in code.

Option B — Multimeter with capacitance mode

Much simpler if your meter has a C range. Most cheap meters measure down to 1
nF reliably. Just clip across the foil leads. You may need to get C above ~500
pF — increase plate size or use a thinner dielectric.

Calculating ε₀ and c

Once you have C, d, and A:
ε₀ = (C × d) / A          [units: F/m]

μ₀ = 4π × 10⁻⁷            [exact, defined]
   = 1.2566 × 10⁻⁶  H/m

c  = 1 / √(ε₀ × μ₀)       [m/s]
Example with realistic values:

Foil: 40×40 cm → A = 0.16 m²
Baking paper: d = 0.06 mm = 6×10⁻⁵ m
Measured C = 470 pF = 4.7×10⁻¹⁰ F

ε₀ = (4.7×10⁻¹⁰ × 6×10⁻⁵) / 0.16
   = 1.76×10⁻¹⁰ F/m

Hmm — but baking paper has relative permittivity ~2.5!
So actual ε₀ = measured ε / εᵣ = 1.76×10⁻¹⁰ / 2.5
             ≈ 7.0×10⁻¹¹ F/m  (true value: 8.85×10⁻¹²)

This is why air gap is more accurate — baking paper's εᵣ introduces error
unless you know its exact relative permittivity. Use the thinnest possible air
gap instead, or calibrate εᵣ separately.

Getting a Good Air Gap
The challenge with air is keeping d uniform and tiny. A practical trick:

Use microscope slide glass (0.17 mm thick) as spacers at the edges
Or playing cards (0.28 mm) stacked to a known thickness
Place spacers only at the very edges so the plates stay parallel
Weigh down uniformly

This way d is known precisely and εᵣ = 1.0006 ≈ 1 (air).

Expected Accuracy

Error sourceTypical impactPlate area measurement~0.5% with careful ruler workd
uniformity (air gap)~5–15% — the hardest partCapacitance measurement~2–5% with
Arduino methodResistor tolerance~1–5% (measure it!)Edge effects (fringing
fields)~2–5% for large plates

Realistically you'll get c within 10–20% of the true value — which is genuinely
impressive for foil and an Arduino, and exactly the kind of accuracy Maxwell
had in the 1860s with far more elaborate equipment.

The Philosophical Payoff

When your Arduino spits out a τ, and your maths produces something in the
neighbourhood of 2–3 × 10⁸ m/s, you've reproduced one of the great intellectual
leaps in physics history — the realisation that electricity, magnetism, and
light are the same phenomenon — using kitchen foil in your backyard.

## Jupyter setup

```sh
# for my ~/.zshrc setup
export WITH_CONDA=1
. ~/.zshrc
conda create -n ipy_env   # only once off as global
conda activate ipy_env
conda install ipython     # only once off
conda install jupyter     # only once off
jupyter notebook
```

## Plan

### 1. Material Characterisation

- **Thickness** — micrometer on a stack of 10 sheets ÷ 10; compare to nominal 16
  µm
- **Mass per unit area** — cut a known area (e.g. 10×10 cm), weigh on accurate
  scales; derive thickness from Al density (2700 kg/m³) and cross-check

### 2. Mechanical Tests

- **Tensile / breaking strain** — hang increasing weights from a strip of known
  cross-section; compare to ~80 MPa × measured area
- **Fold score threshold** — score with increasing force (small weights on a
  rounded edge) to bracket the crease threshold (expect 1–5 N)

### 3. HCl Dissolution (chemistry with purpose)

- Reaction: `2Al + 6HCl → 2AlCl₃ + 3H₂`
- Weigh a precise area of foil → drop in dilute HCl → weigh vessel + foil
  periodically
- Mass loss = H₂ evolved; from stoichiometry derive how much Al reacted →
  cross-check thickness/purity
- Compare measured dissolution rate to published data for 99.x% Al foil (food
  grade is typically 99.35 %)
- ⚠️ do outdoors, avoid breathing HCl fumes

### 4. RF Attenuation — 433 MHz & 2.4 GHz
- **433 MHz Arduino radios**: establish baseline RSSI/range; wrap the receiver
  in N layers of foil; log at which layer count comms fail
- **nRF24L01 (2.4 GHz)**: same layering test; 2.4 GHz has shorter wavelength so
  expect it to attenuate faster than 433 MHz — a nice comparison curve
- Plot layers vs RSSI (if the module exposes it) or simply "still linked /
  dropped"

### 5. mmWave Radar Attenuation
- Point the radar at a fixed object; record baseline return; add foil layers
  between radar and target
- Foil is highly reflective at mmWave — expect strong reflection with even one
  layer; the interesting question is whether it kills the signal *behind* the
  foil or just bounces it back
- Try: flat sheet, crumpled sheet, double-walled "Faraday tube" — crumpling
  should scatter rather than reflect

### 6. DIY Capacitor → Maxwell's Speed of Light
- See detailed method above — build foil parallel-plate cap, measure C with
  Arduino RC timing, compute ε₀, then `c = 1/√(ε₀μ₀)`
- Aim: get within 20% of 3×10⁸ m/s using only foil, a ruler, and an Arduino

### Write-up arc
Material spec → mechanical → chemical purity → RF characterisation (three
frequencies) → the party trick (speed of light). That's a genuine multi-domain
review of "just foil".

## Experiments

### 1. Material Characterisation

**Cutting accurate 10×10 cm coupons**
- Print a 10×10 cm box on paper; lay foil on top; tape corners down
- Metal ruler + scalpel on a self-healing mat — one clean pass, no sawing
- Cut 5 coupons per batch; weigh all 5 together and divide to reduce per-coupon scale noise

#### a. Thickness (micrometer stack method)

`t = total / sheets`; compare to nominal 16 µm

| trial | sheets | total (mm) | per sheet (µm) | Δ from 16 µm |
|------:|-------:|-----------:|---------------:|-------------:|
|     1 |     10 |            |                |              |
|     2 |     10 |            |                |              |
|     3 |     10 |            |                |              |
|     1 |     20 |            |                |              |
|     2 |     20 |            |                |              |
|     3 |     20 |            |                |              |
| **mean** |   |            |                |              |

#### b. Mass per coupon → density cross-check

`t_mass = m / (A × ρ)` where A = 0.01 m², ρ = 2700 kg/m³
Expected mass of one 10×10 cm coupon at 16 µm: `0.01 × 16e-6 × 2700` = **0.432 g**

| coupon | mass (g) | t from mass (µm) | Δ from micrometer (µm) |
|-------:|---------:|-----------------:|-----------------------:|
|      1 |          |                  |                        |
|      2 |          |                  |                        |
|      3 |          |                  |                        |
|      4 |          |                  |                        |
|      5 |          |                  |                        |
| **mean** |        |                  |                        |

---

### 2. Mechanical Tests

#### a. Tensile (strip method)

Cut a 10 mm-wide strip across the full 300 mm roll width.
Cross-section = `10 mm × t_measured`. Expected failure ~80 MPa → ~13 N → ~1.3 kg for a 10 mm strip.

| trial | width (mm) | failure load (g) | UTS (MPa) | notes |
|------:|-----------:|-----------------:|----------:|-------|
|     1 |            |                  |           |       |
|     2 |            |                  |           |       |
|     3 |            |                  |           |       |

#### b. Fold / score threshold

Blunt tool on a 1 mm edge, increasing mass. Record lightest load that leaves a permanent set.

| trial | load (g) | permanent crease? |
|------:|---------:|-------------------|
|     1 |          |                   |
|     2 |          |                   |
|     3 |          |                   |

---

### 3. HCl Dissolution

⚠️ Outdoors. Safety glasses. Dilute hardware HCl ~1:3 in water → ~5–10 %.

Reaction: `2Al + 6HCl → 2AlCl₃ + 3H₂↑`

Tare a beaker of HCl on the scales. Drop in one 10×10 cm coupon. Log **beaker mass** — H₂ escapes so mass drops as Al dissolves. Total expected H₂ from one coupon: `0.432 g Al × (6/54) × 2` = **0.096 g**.

Stoichiometry shortcut: `H₂ lost (g) × (27/3) = Al dissolved (g)`

| time (s) | beaker mass (g) | H₂ lost (g) | Al dissolved (g) | % of coupon |
|---------:|----------------:|-------------:|-----------------:|------------:|
|        0 |                 | 0            | 0                | 0           |
|       30 |                 |              |                  |             |
|       60 |                 |              |                  |             |
|      120 |                 |              |                  |             |
|      300 |                 |              |                  |             |
| complete |                 |              |                  |             |

From final Al dissolved + known area → independent thickness check.

---

### 4. RF Attenuation

#### Test geometry

```
[TX] ←── fixed 30 cm ──→ [RX / TinySA probe]
                   │
             [N layers foil
              perpendicular
              to path]
```

Add one layer at a time. Keep TX–RX distance fixed. Record dBm on TinySA **or** link metrics from the module.

#### TinySA tips

- Centre on test frequency, span ±5 MHz, RBW auto, average 5 sweeps per reading
- Standard TinySA: 100 kHz–960 MHz → covers 433 MHz ✓
- **TinySA Ultra needed for 2.4 GHz** (nRF24, Zigbee); if not available use packet-loss method below

#### a. 433 MHz

Hold DATA pin HIGH on FS1000A/XY-FST for continuous carrier; TinySA measures received dBm.

```cpp
// 433 MHz TX — continuous carrier on pin 12
void setup() { pinMode(12, OUTPUT); digitalWrite(12, HIGH); }
void loop() {}
```

| layers | dBm (TinySA) | Δ baseline (dB) | linked? |
|-------:|-------------:|----------------:|---------|
|      0 |              | 0               | yes     |
|      1 |              |                 |         |
|      2 |              |                 |         |
|      5 |              |                 |         |
|     10 |              |                 |         |

#### b. nRF24L01+ 2.4 GHz — packet-loss method

nRF24L01+ exposes RPD (Received Power Detector: HIGH if >−64 dBm) — not true RSSI, but packet loss rate gives an attenuation curve.

```cpp
// RX side — RF24 library
#include <RF24.h>
RF24 radio(7, 8);

void setup() {
  Serial.begin(115200);
  radio.begin();
  radio.setChannel(76);               // 2476 MHz
  radio.setPALevel(RF24_PA_MAX);
  radio.setDataRate(RF24_250KBPS);    // lowest rate = most link margin
  radio.openReadingPipe(1, 0xF0F0F0F0E1LL);
  radio.startListening();
}

void loop() {
  static uint32_t rx = 0, t0 = 0;
  if (radio.available()) { uint8_t b[32]; radio.read(b, 32); rx++; }
  if (millis() - t0 > 1000) {
    Serial.print("RPD:"); Serial.print(radio.testRPD());
    Serial.print("  pkt/s:"); Serial.println(rx);
    rx = 0; t0 = millis();
  }
}
// TX side: openWritingPipe same address, radio.write() every 10 ms
```

| layers | RPD (0/1) | pkt/s (of ~100) | loss % |
|-------:|----------:|----------------:|-------:|
|      0 |           |                 |        |
|      1 |           |                 |        |
|      2 |           |                 |        |
|      5 |           |                 |        |

#### c. Zigbee 2.4 GHz — RSSI via AT command

For XBee Series 2: `ATDB` returns last-hop RSSI in −dBm. For other modules check coordinator software for RSSI field.

```python
import serial, time

s = serial.Serial('/dev/ttyUSB0', 9600, timeout=1)
s.write(b'+++'); time.sleep(1)        # enter command mode
s.write(b'ATDB\r'); time.sleep(0.2)
raw = s.read(s.in_waiting).strip()
print(f"RSSI: -{int(raw, 16)} dBm")
s.write(b'ATCN\r')                    # exit
```

| layers | RSSI (dBm) | Δ baseline (dB) | linked? |
|-------:|-----------:|----------------:|---------|
|      0 |            | 0               | yes     |
|      1 |            |                 |         |
|      2 |            |                 |         |
|      5 |            |                 |         |

---

### 5. mmWave Radar

Point radar at a fixed hard target ~1 m away. Note baseline amplitude/SNR. Insert foil perpendicular to beam path.

| config                         | amplitude / SNR | target still detected? | notes |
|--------------------------------|----------------:|------------------------|-------|
| baseline (no foil)             |                 | yes                    |       |
| 1 layer flat                   |                 |                        |       |
| 2 layers flat                  |                 |                        |       |
| 1 layer crumpled               |                 |                        |       |
| foil cylinder around target    |                 |                        |       |

Expected: flat foil reflects strongly back to radar (target behind it disappears); crumpled scatters the beam. The Faraday-tube config should ghost the target entirely.

---

### 6. DIY Capacitor → Speed of Light

Method: [Mega extension](#mega-extension---maxwells-speed-of-light-calculation) above. Code: [Plan §6](#6-diy-capacitor--maxwells-speed-of-light).

| trial | A (m²) | d (m) | C (pF) | ε₀ (×10⁻¹² F/m) | c (×10⁸ m/s) | % error |
|------:|-------:|------:|-------:|----------------:|-------------:|--------:|
|     1 |        |       |        |                 |              |         |
|     2 |        |       |        |                 |              |         |
|     3 |        |       |        |                 |              |         |