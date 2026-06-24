# I Became the Agent
### AI as master controller — you as the one who has to show up

<!-- 
Michael Milewski — failure-driven.com
Engineering leader at The Martec, Polish Scout leader, electronics hobbyist
Tonight: not a Ruby talk. A talk about what happened when I stopped orchestrating AI and let it orchestrate me.
-->

---

## The Dream Loop Problem

> "The dream loop was too long."

- Ideas were cheap. Execution was the bottleneck
- Gap between "I want to build X" and actually building it: **months, years**
- By the time I figured out how to do it, I'd moved on
- Notebooks full of projects I never started

<!-- 
Everyone here has a drawer of components, a list of side projects, a graveyard of half-finished ideas.
The constraint was never creativity. It was the execution gap.
-->

---

## The Inversion
Human ──orchestrates──▶ AI
### vs
AI ──orchestrates──▶ Human

- Conventional model: you decide, AI assists
- New model: AI holds the context, suggests next steps, reviews feasibility
- **You are the agent. AI is the master controller.**
- The cost: something else is doing the orchestrating

<!-- 
This is the thesis. Everything tonight is an example of it.
I am getting more done than ever. I am also, genuinely, the AI's hands.
-->

---

## Act 1: The Warm-Up — Scouts

- Badge writeups, risk assessments, hike plans
- Bilingual field passport for a camp on Minjerribah
- **Removed the friction** between knowing what needed doing and having a document exist
- Anyone here do volunteer work? You know the admin tax. AI ate it.

<!-- 
Not glamorous. But this is where most people stop.
"I use AI for documents." Great. Keep going.
-->

---

## Act 2: Code (the expected bit)

- Mass refactoring, decoupling legacy systems
- Security gap analysis
- Video processing pipeline architecture
- **Everyone's doing this.** This is table stakes.

<!-- 
60 seconds on this slide. They know. Move on.
The interesting stuff is coming.
-->

---

## Act 3: Electronics — The Dream List Collapses

- Long-held hobby. Years of "I want to build..."
- AI as research partner, component selector, architecture reviewer
- The dream-to-execution loop: **weeks, not years**
- I started saying yes to things I would have deferred forever

<!-- 
This is where it got weird. And fun. And slightly dangerous.
-->

---

## Sentinel Box

- Element14 "Smart Security" design challenge
- Lock box for family screen-time devices
- AI helped design a **crank-slider vault mechanism**
- Simulated it in an HTML canvas before cutting a single piece of Perspex

<!-- 
I would never have attempted this mechanism solo. Too much to research, too many unknowns.
AI held the context. I held the jigsaw.
-->

---

![Computer animation of vault door mechanism](https://saramic.github.io/sentinel-box/assets/20260511_lock_unlock_vault_door.gif)

<!-- Simulation first. AI wrote this. I verified it looked right. -->

---

![Hand cut perspex model of vault door mechanism](https://saramic.github.io/sentinel-box/assets/20260512_perspex_model.gif)

<!-- Then I built it. Real Perspex, real stepper motor, real crank-slider. -->

---

![Hand cut perspex gear teeth](https://saramic.github.io/sentinel-box/assets/20260524_mechanism_01.jpg)

<!-- These gear teeth. Hand cut. From a design I didn't fully understand until AI explained it three times. -->

---

## Green Brain

- Element14 "On the Line" design challenge
- CAN bus distributed greenhouse control platform
- Arduino UNO Q nodes, LabVIEW dashboard
- And a water-directed cannon 🔫

<!-- 
Industrial protocol, distributed nodes, real-time visualisation.
Six weeks. With a day job and three kids.
-->

---

<video src="https://saramic.github.io/green-brain/assets/20260620_palying_around_with_firing_the_cannon.mp4" controls width="800"></video>

<!-- This is the water cannon. It did not always go where intended. -->

---

## The Aluminium Foil DevKit

- Element14 April Fools road test: **a pack of kitchen foil**
- I took it seriously anyway
- Measured actual thickness: 14.32 µm (10.5% thinner than nominal)
- HCl dissolution kinetics, tensile strength, RF attenuation at 433 MHz

<!-- 
When you're in the frenzy, even a joke becomes a real experiment.
AI helped me structure the methodology. I did the chemistry. Outdoors. With safety glasses.
-->

---

## The Acid Test

![](./images/al_foil_acid.jpg)

<!-- 
Two of three attempts were too vigorous to measure.
Fresh acid + warm exothermic reaction = thermal runaway.
Same principle as a battery fire. I learned this the hard way.
-->

---

<video src="https://saramic.github.io/learning/assets/2026-06-23/al_foil_acid_runaway_reaction.mp4" controls width="800"></video>

<!-- That's hydrogen gas. And HCl vapour. And me, outside, slightly alarmed. -->

---

![tiny SA setup on my kitchen bench with cat in the background as I attenuate RF with aluminium foil](https://saramic.github.io/learning/assets/2026-06-23/rf_tiny_sa_side.jpg)

<!-- 
RF attenuation at 433 MHz. TinySA Ultra. Kitchen bench. Cat photobombing.
30 dB total attenuation over 24 layers. Theory predicted 31.6 dB per layer — 
turns out indoor multipath is a thing.
-->

---

## The JBL Earbuds

![](./images/jbl_battery.jpg)

- Wife's JBL earbuds: declared broken
- New confidence: **pull it apart, figure it out**
- Decided it was broken → extracted the battery → charged it directly
- It worked. Mostly.

<!-- 
Six months ago I would have thrown these out or sent them for repair.
Now I have a soldering iron, a bench power supply, and enough AI-given confidence to be dangerous.
This is what the dream loop collapsing looks like in domestic life.
-->

---

## Act 4: Music

<video src="assets/gracie_and_michael_recorder_web.mp4" controls width="800"></video>

<!-- 
AI composed a four-part recorder arrangement.
I had to convince my children to perform it.
The AI has no idea what it started.
-->

---

## The Pattern

| AI does | You do |
|---|---|
| Research & architecture | Buy the components at 2am |
| Simulate & review | Cut the Perspex |
| Hold all the context | Mix the chemicals |
| Suggest next steps | Negotiate with your children |

<!-- 
The division of labour is more extreme than anyone talks about.
AI is not your assistant. In this model, you are its hands.
-->

---

## Live Demo

**Does this talk have good bones?**

```bash
GEMINI_API_KEY=xxx ruby gemini_talk_review.rb talk.mp4
```

<!-- 
Start recording now if you haven't already.
Feed the last 20 minutes into Gemini via the Files API.
Read back: energy moment, despair moment, best clip for X, 80-word summary.
The talk is analysing itself. This is the point.
-->

---

## What Gemini Said

<!-- paste output here live -->

---

## The Honest Bit

- I'm getting more done than I have in years
- The dream loop has collapsed across every domain
- The cost is that something else is doing the orchestrating
- I am, genuinely, the AI's agent

> *"Where's your dream loop — and what's it costing you?"*

<!-- 
Not a pitch. Not a warning. Just an observation.
The frenzy is real. The output is real. The question is whether you're comfortable being the one who has to show up.
Thanks.
failure-driven.com — @saramic
-->
