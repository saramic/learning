# EZ-EV Challenge

[https://community.element14.com/challenges-projects/design-challenges/ez-ev-challenge/](https://community.element14.com/challenges-projects/design-challenges/ez-ev-challenge/)

- **UNO Q**: dual-brain (Linux/Qualcomm + STM32 real-time MCU), AI-capable,
  WiFi/BT, camera support
- **ADM3068E eval board**: RS-485 transceiver, full-duplex, 50 Mbps, ±12 kV ESD
  protection, screw terminals for easy wiring — fundamentally a robust
  industrial serial bus interface

## VapeCell EV

> From Waste to Watts: A Salvaged-Battery EV with Intelligent RS-485 Cell Monitoring

### About Me

I am a Software Developer in the startup scene of Melbourne, Australia for over
25 years. I build scalable, fault-tolerant distributed systems — and recently my
focus has shifted toward Agentic AI and edge intelligence. I am an amateur
electronics enthusiast whose hardware passion was reignited by the explosion in
commodity microcontrollers, in no small part thanks to Arduino. I recently
placed runner-up in Smart Security and Surveillance challenge using MAX32630FTHR
and currently taking part in CAN-bus smart greenhouse controller as well as
doing my final write up for the E14 Al Foil aTtenuator DevKit.

The Arduino UNO Q — a full Linux computer sitting alongside a real-time
microcontroller — is exactly the kind of hardware that excites me, my
programming is stronger than my electronics build. Paired with the ADM3068E
RS-485 transceiver, this challenge is an opportunity to build something that
sits at the intersection of sustainability, embedded systems, and edge AI.

### The Problem

Australia discards tens of millions of single-use vapes every year. Each device
contains a small lithium-ion cell — typically 280 mAh to 650 mAh — that is
functional, reasonably healthy, and destined for landfill. The cells are not
exotic: most are standard cylindrical or pouch lithium chemistries, identical in
principle to those powering electric vehicles at scale. Meanwhile, the barrier
to understanding EV battery systems is high. Battery Management Systems are
treated as black boxes. Most hobbyist BMS hardware does one thing: cut power
when a threshold is breached. It does not explain what the pack is doing, which
cells are weak, or how the battery is ageing. The result is that battery
literacy remains low at exactly the moment it matters most — as lithium cells
proliferate in everything from bikes to buses.

The core question this project addresses: can we harvest discarded vape cells,
characterise and assemble them into a small EV pack, and instrument that pack
with a genuinely observant monitoring system — one that doesn't just protect
the battery, but understands it?

### The Solution: VapeCell EV

VapeCell EV is a salvaged-battery electric vehicle prototype with an
intelligent, RS-485 networked battery monitoring system at its heart. It
combines environmental storytelling with real industrial communication
architecture.

A small wheeled platform — an old robot vacuum cleaner chassis — is powered
entirely by cells harvested from discarded single-use vapes. The pack is not
just assembled and run; it is continuously observed by a distributed monitoring
network where each cell group has its own sensor node reporting over RS-485 to
an Arduino UNO Q master. The UNO Q Linux side runs a live battery analytics
dashboard, State-of-Health estimation, and thermal anomaly detection. The
real-time STM32 side handles millisecond-level bus polling and safety cut-off.
This is not a BMS. A BMS protects your battery. VapeCell EV understands it.

### Why This Is Different From an Off-The-Shelf BMS

A commercial BMS — even a good one — is a protection circuit. It trips a
MOSFET on overvoltage, undervoltage, or overcurrent. It assumes matched, new,
same-chemistry cells from a single manufacturer. It has no bus, no logging, no
cell-level visibility.

Salvaged vape cells are the opposite of that assumption: mixed brands, unknown
cycle histories, varying capacity, potentially different chemistries. This is
precisely where per-cell observability matters most, and where no off-the-shelf
product helps.

The RS-485 network gives each cell group its own voice. The UNO Q gives the
system memory and intelligence. Together they answer questions a BMS cannot:
Which cell is weakest? Which is running hotter than its neighbours? Is a cell's
internal resistance rising over successive cycles? Which cells are still worth
using and which should be retired?

### Why RS-485 and the ADM3068E

RS-485 is the backbone of real industrial battery monitoring. Modbus RTU over
RS-485 is how commercial battery racks in data centres, solar installations,
and EV charging infrastructure report cell telemetry to management systems.
Building the same architecture at prototype scale demonstrates the same
principles.

The ADM3068E brings two properties that are directly relevant to a battery environment:

- **±12 kV IEC ESD protection** on all bus pins. A cell short-circuit, pack
  disconnect, or motor back-EMF can inject transients onto signal wiring. The
  ADM3068E is rated for exactly this kind of electrically hostile environment —
  not as a marketing claim but as a tested IEC 61000-4-2 specification.
- **50 Mbps at 3.0 V–5.5 V** with a 1.62 V VIO rail, allowing the STM32 on the
  UNO Q to interface directly without level shifting, keeping the wiring simple
  and the node count expandable.

The eval board's screw terminal connections and on-board termination resistors
mean the RS-485 bus can be assembled without custom PCBs — exactly right for a
prototype build.

### System Architecture

```
                    ┌────────────────────────────────────┐
                    │          Arduino UNO Q             │
                    │  ┌──────────────┐  ┌────────────┐  │
                    │  │  Linux MPU   │  │ STM32 MCU  │  │
                    │  │  (Python)    │  │  (C++/RT)  │  │
                    │  │  Dashboard   │  │  RS-485    │  │
                    │  │  SoH Model   │  │  Bus Poll  │  │
                    │  │  Anomaly Det │  │  Safety    │  │
                    │  └──────────────┘  └────────────┘  │
                    │      EVAL-ADM3068EEBZ (RS-485)     │
                    └──────────────┬─────────────────────┘
                                   │ RS-485 bus (twisted pair)
         ┌─────────────────────────┼────────────────────────┐
         │                         │                        │
┌────────┴────────┐     ┌──────────┴──────┐     ┌───────────┴─────┐
│  Cell Node A    │     │  Cell Node B    │     │  Cell Node C    │
│  ATmega/ESP32   │     │  ATmega/ESP32   │     │  ATmega/ESP32   │
│  Voltage sense  │     │  Voltage sense  │     │  Voltage sense  │
│  NTC thermistor │     │  NTC thermistor │     │  NTC thermistor │
│  Modbus RTU     │     │  Modbus RTU     │     │  Modbus RTU     │
│  Cells: Group A │     │  Cells: Group B │     │  Cells: Group C │
└─────────────────┘     └─────────────────┘     └─────────────────┘

UNO Q STM32 ──► Motor controller (PWM)
UNO Q Linux ──► Web dashboard (live cell telemetry, SoH, thermal map)
UNO Q Linux ──► Session logger (charge/discharge curves, cycle counter)
```

### The Hardware

**Sponsored Kit Components**

- Arduino UNO Q (master controller, Linux + STM32 dual-brain)
- EVAL-ADM3068EEBZ — ADM3068E RS-485 transceiver evaluation board
- (RS-485 bus master interface, ±12 kV ESD protection)
- Molex connectors (pack wiring termination and cell node connections)

**Additional Components (self-sourced)**

- Salvaged single-use vape devices (cell source — collected, discharged safely,
  disassembled) - _I have about 30 already, call me a junk collector_
- ATmega328 or ESP32 boards × 3 (RS-485 cell monitor nodes)
- MAX485 or equivalent RS-485 transceiver modules × 3 (node bus interface)
- Precision resistor voltage dividers (per-cell voltage sensing)
- NTC thermistors × 6 (cell temperature monitoring)
- old robot vacuum cleaner chassis with wheels and motor as EV base
- XT30 / XT60 connectors (pack interconnects)
- Fuse + contactor (pack safety disconnect)
- Twisted pair cable (RS-485 bus wiring)
- 120 Ω termination resistors (bus termination at far end)
- Laptop or small display (UNO Q dashboard output)

### The Project Plan

### Phase 1 — Cell Harvesting and Characterisation (Weeks 1–2)

- Safely collect, discharge, and disassemble single-use vape devices
- Measure open-circuit voltage, internal resistance, and rough capacity of each cell
- Sort and group cells by chemistry, voltage, and health for pack assembly
- Document the sourcing and safety process in detail
- Blog post: the vape battery waste problem, safe disassembly, and what we found inside

### Phase 2 — RS-485 Cell Monitor Network (Weeks 3–4)

- Assemble three RS-485 cell monitor nodes (ATmega/ESP32 + voltage divider + thermistors)
- Establish Modbus RTU communication between nodes and UNO Q over the EVAL-ADM3068EEBZ
- Validate per-cell voltage and temperature readings across all nodes
- Implement basic over-voltage / under-voltage / over-temperature alerts on STM32 side
- Blog post: RS-485 bus architecture, Modbus RTU design, and why the ADM3068E's
  ESD protection matters in a battery environment

### Phase 3 — Pack Assembly and EV Platform (Weeks 5–6)

- Wire characterised cells into groups, balance across nodes
- Mount pack on robot vacuum chassis, wire to motor controller
- Integrate STM32 safety cut-off (pack disconnect on fault condition)
- First rolling test with live RS-485 telemetry
- Blog post: pack assembly, balancing salvaged cells, and the first drive

### Phase 4 — UNO Q Analytics Dashboard (Weeks 7–8)

Python application on UNO Q Linux side:

- Live cell voltage and temperature visualisation (per-node heatmap)
- State-of-Health estimation (voltage sag under load, capacity fade tracking)
- Cycle counter and session logger (charge / discharge curves to file)
- Anomaly alerts (cell diverging from pack average)

Blog post: building a battery intelligence system on the UNO Q

### Phase 5 — Stretch: Predictive Fault Detection with TinyML (If time permits)

Real EV charging infrastructure degrades in the field — connectors corrode,
termination loosens, stub impedance shifts. The ADM3068E eval board exposes
test points on every bus signal, making it ideal for waveform capture.
This stretch phase applies TinyML directly to the RS-485 bus itself:

- Deliberately inject fault conditions onto the bus: missing termination, stub
  reflections, marginal signal amplitude
- Capture bus waveforms at each fault state using the eval board test points
- Label and export a dataset; train a small Edge Impulse classification model
- Deploy the model on the UNO Q and run real-time bus health classification:
  healthy / unterminated / stub / high-noise
- Narrative: predictive maintenance for EV charging wiring — detecting wiring
  degradation before it causes failures

This is the same principle used in industrial condition monitoring systems, at a
scale achievable on one eval board.

### Phase 6 — Integration and Documentation

- Full system integration test (pack, drive, RS-485 monitoring, dashboard)
- Final project blog with video demonstration
- Open-source code release (GitHub)
- Reflections on salvaged cell viability and what a production version would require

### Blog Post Plan

| Post         | Topic                                                                                     |
| ------------ | ----------------------------------------------------------------------------------------- |
| Forum Post 1 | Inside a vape: the battery waste problem, safe disassembly, and what we found             |
| Forum Post 2 | RS-485 cell monitoring: Modbus RTU design and why ESD protection matters near batteries   |
| Forum Post 3 | Pack assembly and first drive: building an EV from rubbish                                |
| Forum Post 4 | Battery intelligence on the UNO Q: SoH estimation, thermal mapping, and anomaly detection |
| Forum Post 5 | Stretch — TinyML on the bus: classifying RS-485 wiring faults with Edge Impulse           |
| Project Blog | Full system documentation, video demo, open-source release, and lessons learned           |

### Credentials

I have taken part in many computer hackathons over the years and only recently
discovered the electronics design challenge community at element14 — and I am
very glad I did. I placed runner-up in the Smart Security and Surveillance
challenge using the MAX32630FTHR, and am currently competing in the "On The
Line" challenge with GreenBrain, a distributed CAN bus greenhouse control
platform. In my professional career I have presented at a number of
conferences, including RubyKaigi 2023 in Japan where I demonstrated a live
electronics build on stage. I bring 25 years of distributed systems thinking,
a genuine maker's enthusiasm, and a commitment to documenting builds thoroughly
and honestly — including the parts that don't work the first time.

More on RS-485

- [https://www.seeedstudio.com/blog/2021/03/18/how-rs485-works-and-how-to-implement-rs485-into-industrial-control-systems](https://www.seeedstudio.com/blog/2021/03/18/how-rs485-works-and-how-to-implement-rs485-into-industrial-control-systems)

Proposal can be found at:

- [https://github.com/saramic/learning/tree/master/competitions/202606_e14_design-challenge_EZ-EV](https://github.com/saramic/learning/tree/master/competitions/202606_e14_design-challenge_EZ-EV)
