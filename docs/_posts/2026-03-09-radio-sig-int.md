---
layout: post
title:  "Radio Signal Inteligence"
date:   2026-03-09 21:00:00 +1100
categories: Radio, war, sig int
---

Telegram @sigintreports, has this pinned at the top

> 📡 What you see posted here is the final result of work that happens behind
> the scenes. Every signal gets monitored, analyzed, and cross-referenced
> against other data points. Patterns get verified multiple times before I
> share anything. I go through each piece carefully to make sure the
> information actually holds up and isn't just noise or coincidence. This
> process takes time, but it's what keeps the analysis reliable and worth your
> attention.
>
> This channel runs independently. There's no institutional backing, no
> sponsors, and no outside funding. I do this on my own because signal
> monitoring and analysis is something I'm deeply invested in, and I want to
> share it with people who find it useful. If the content here has been
> valuable to you, Telegram Stars help sustain the time, equipment, and
> resources that go into maintaining this level of coverage. It's completely
> voluntary. Either way, I'm grateful for everyone who follows along and
> engages with the work 📡

> It is important to note that some posts are intentionally high-level and
> minimal. Specific frequencies, bands, and other technical SIGINT details are
> omitted to protect collection methodologies, maintain legal compliance, and
> avoid disclosing sensitive monitoring capabilities.
>
> All content posted here is derived from open-source radio monitoring. No
> classified information is shared. No individuals are targeted or identified.
> Any attempt to misuse, misrepresent, or contact me regarding sensitive topics
> will be ignored and logged.
>
> Signal Reports is an open-source SIGINT aggregation channel focused
> exclusively on publicly receivable radio transmissions. All posts are
> high-level, non-attributable, and contain no classified or personally
> identifiable information. This channel does not engage with, respond to, or
> facilitate requests related to operational intelligence. Persistent or
> suspicious contact will be documented and reported as appropriate.
>
> **ATTRIBUTION & USAGE:**
> If you utilize any information, reports, or media from this channel or
> website for your own research, social media channels, or publications, I
> kindly request that you provide proper credit for my work. Monitoring and
> analyzing these signals involves significant time, technical resources, and
> dedicated collection efforts. Attributing your sources to "Signal Reports"
> ensures that the effort behind this work is recognized and supports the
> continued sharing of this data.

but what exactly are the "open-source radio monitoring" data sources and
techniques.

Asking AI gives me the following

Short answer: yes, partly like `ADS-B` ship/plane tracking with crowdsourced
receivers—but a lot of what those channels post is a mix of public sensors,
hobbyists with `SDRs`, and interpretation of other clues. It’s rarely a single
source.

Here’s how Telegram channels like SIGINT Reports usually get those updates.

1. **Crowdsourced radio monitoring** (very similar to ADS-B networks)

Many hobbyists run software-defined radios (`SDR`) that can monitor wide ranges
of radio frequencies. These are cheap USB receivers like `RTL-SDR`, `HackRF`,
`BladeRF`, etc.

People use them to listen to:

- VHF/UHF military radio
- aviation comms
- drone telemetry
- radar emissions
- satellite downlinks

Some enthusiasts run automated monitoring stations and feed data to communities
(Discords, Telegram groups, forums).

Typical setup:

```
Antenna
   ↓
RTL-SDR / HackRF
   ↓
Computer decoding software
   ↓
Shared data or alerts
```

Examples of crowdsourced RF monitoring ecosystems:
- SatNOGS (satellite downlinks)
- ADS-B / Mode-S networks
- AIS ship tracking
- ACARS aircraft messages
- hobby SIGINT communities

2. **Unencrypted military radio traffic**

A surprising amount of battlefield communication is still analog voice radio.

Especially:
- VHF tactical radios
- field units using older systems
- emergency comms
- logistics channels

If the encryption is weak/legacy, this is COMINT (communications intelligence)
— intercepting voice communications not intended for you.

Example posts you see:

> “intercepted Russian voice comms”
>
> “unit requesting artillery”
>
> “radio chatter about drone”

Often these are simply radio hobbyists near the war zone.

3. **Electronic emissions monitoring** (radars, jammers, etc.)

Radars, jammers, and many military systems emit very distinctive radio
signatures.

That’s ELINT (electronic intelligence) — analyzing non-communication signals
like radar emissions.

Each system has a unique:
- frequency
- pulse repetition rate
- modulation pattern
- scan timing

For example:

> System	        Signature
> S-300 radar	    specific pulse pattern
> Patriot radar	    different frequency + sweep
> jammer	        broadband noise burst

SIGINT watchers can detect:

- radar turning on/off
- jamming activity
- air defense activation
- Even without decoding anything.

4. **Satellite and space-based intercepts**

Some signals are picked up by:
- satellite downlinks
- satellite ground stations
- commercial RF monitoring networks

Professional intelligence agencies obviously do this too, but OSINT analysts
sometimes see indirect evidence like:
- satellite telemetry leaks
- satellite imagery of jamming activity
- unusual radio bursts.

5. **Direction finding networks**

With multiple receivers you can triangulate the source of a transmitter.

Technique:
- several SDR stations detect same signal
- measure direction/arrival time
- compute location.

This is called radio direction finding (RDF).

Some amateur networks already do this.

6. **Other OSINT signals combined with RF**

Channels like SIGINT Reports don’t rely on RF alone. They combine:
- satellite imagery
- ADS-B aircraft
- AIS ships
- social media videos
- NOTAM alerts
- acoustic sensors
- battlefield reports

Example:

> radar disappears
> + drone video appears
> + pilots report no radar lock
> → likely radar destroyed

7. **Jamming detection**

Even if a jammer is active, you can still detect:
- sudden broadband RF noise
- loss of radar emissions
- GPS disruption
- spike in interference levels.

Jamming works by transmitting powerful signals to overwhelm receivers, but the
jamming signal itself is visible to spectrum monitors.

So observers may say:
> “heavy GPS jamming detected in region”

because their receivers suddenly see the noise.

8. Important: many Telegram posts are inference

Some reports come from real RF monitoring.

Others are analysis or speculation based on partial clues.

So when a channel says:

> “radar offline”
>
> “jammer activated”
>
> “comms intercepted”

it may be:
- SDR intercept
- military leak
- drone observation
- analyst inference.

✅ Bottom line

Yes — your intuition is correct.

Many of these updates come from crowdsourced SDR monitoring networks, similar
in concept to ADS-B flight tracking, but for radio spectrum signals.

But the channels usually combine RF intercepts + OSINT + analysis, not just one
SDR receiver.

If you're interested, I can also show you something fascinating:

How hobbyists can identify specific military radars (S-300, Patriot, A-50) just
from RF fingerprints. It’s a really cool part of SIGINT.

## Identifying military radars from RF fingerprints

Military radars basically have RF “fingerprints”, and analysts can often
identify the exact radar type just from the signal.

I'll walk through how this works.

1. Every radar emits a unique signal pattern

A radar is not just “a radio wave.” It transmits very specific pulses of energy
with consistent parameters:

Key parameters analysts measure:

- Parameter                             What it means
- Frequency band                        e.g., L-band, S-band, X-band
- Pulse repetition frequency (PRF)      pulses per second
- Pulse width                           duration of each pulse
- Scan rate                             antenna rotation speed
- modulation pattern            	    how the pulses change

For example:

PRF = how many pulses per second the radar sends.

Radars transmit short bursts then listen for echoes before the next pulse.

Those numbers create a distinctive signature.

2. Example of radar “fingerprints”

A simplified example (illustrative):

- Radar type                    Frequency	    PRF     	Scan
- Long-range early warning	    L-band	        ~400 Hz 	slow sweep
- Fire control radar            X-band	        high PRF	narrow beam
- Air defense radar             S-band      	medium PRF	rotating dish

For instance:

AN/FPS-20 early warning radar
- ~1300 MHz
- ~400 pulses/sec PRF

Even if you never see the radar, intercepting that signal lets analysts
recognize it.

3. Electronic intelligence receivers measure dozens of properties

Modern ELINT systems measure many characteristics of the signal:
- frequency
- pulse repetition pattern
- pulse width
- power
- modulation
- timing jitter
- angle of arrival

Then compare them to a database of known radar signatures.

This process is called Specific Emitter Identification (SEI).
Advanced systems can even identify the exact individual radar unit based on
tiny imperfections in the electronics.

It’s similar to:
- voice recognition
- device fingerprinting
- Wi-Fi RF fingerprints.

4. Why radars are easy to detect

Radar transmitters are extremely powerful.

Typical radar transmit powers:
- hundreds of kilowatts
- sometimes megawatts.

Even if you are hundreds of kilometers away, a receiver can detect the emissions.

That’s why ELINT aircraft exist (like RC-135 Rivet Joint).

But hobbyists with SDRs can sometimes detect nearby systems too.

5. How analysts know when a radar goes offline

If a radar normally emits:

frequency: 3.1 GHz
PRF: 850 Hz
scan: every 6 seconds

and suddenly the signal disappears:

→ radar turned off
→ radar destroyed
→ radar moved
→ radar switched modes.

SIGINT channels often track these changes.

6. Radar mode changes also reveal intent

Radars change modes depending on what they’re doing.

Example:

Mode                	Signature
Search              	slow scan, low PRF
Track               	narrow beam, higher PRF
Missile guidance    	very high PRF

So if a radar suddenly changes parameters, analysts might infer:

air defense active

missile launch preparation

target tracking

7. What hobbyists can actually detect

With decent SDR equipment you can sometimes detect:
- weather radars
- airport radars
- maritime radars
- some military radars
- drone control links
- GPS jamming.

People run automated software that logs signals and flags new emitters.

8. Real military ELINT is far more advanced

Professional SIGINT platforms measure:

- nanosecond timing
- angle of arrival
- multi-station triangulation
- wideband spectrum

They build huge emitter databases.

Example platforms:

- RC-135 Rivet Joint
- EP-3 Aries
- EA-18G Growler
- satellite SIGINT systems

9. A simple visualization

Think of radar signals like musical rhythms.

Radar A:

beep...beep...beep...beep

Radar B:

beep-beep-beep......beep-beep-beep

Radar C:

beeeeeep......beeeeeep

Even if you can't see the radar, the pattern tells you what it is.

✅ Bottom line

Radar identification works because:

every radar has a distinct RF signature

analysts record frequency, pulse timing, and modulation

those parameters act like a fingerprint.

Even hobbyists with SDRs can sometimes recognize certain systems.

If you're interested, I can also show you something fascinating:

How OSINT analysts tracked Russian air defense radars and jammers in Ukraine
using open-source RF monitoring and satellites. It's a really interesting case
study.

So what hardware is required to detect local airport or weather radar? And what
software to make available in the web to my friends?

Yes — you can absolutely build a small home RF monitoring station that detects
things like:
- airport radar
- weather radar
- aircraft transponders
- satellite signals
- other radio emissions

…and then share the spectrum or decoded data online with friends. Many
hobbyists do exactly this. 📡

I'll break it into hardware, software for detection/decoding, and ways to
publish it online.

### 1️⃣  Hardware you need

You don't need expensive gear to start. A good beginner setup costs $80–$300.

Basic setup (works for many signals)

Receiver
- RTL-SDR Blog V3 USB SDR
- about $40–$60
- covers 500 kHz – 1.7 GHz
- perfect for beginners

Computer
- Raspberry Pi 4 or mini PC
- Linux machine works best

Antenna
Depends on what you want to monitor:

Target      	Frequency   	Antenna
aircraft ADS-B 	1090 MHz    	1090 MHz antenna
airport radar	1–3 GHz     	wideband discone
weather radar	2.7–3.0 GHz 	directional antenna
satellite   	1–2 GHz     	patch or LNA antenna

A very common starter antenna:
discone antenna (covers a huge range).

Slightly more advanced SDRs

If you want better performance:

HackRF One SDR

1 MHz–6 GHz coverage

transmit + receive

Airspy R2 Software Defined Radio

much cleaner signals

These are used by many RF hobbyists.

### 2️⃣  Signals you can easily detect

From Melbourne you could detect things like:

Aircraft transponders

ADS-B aircraft location.

Example network:

FlightRadar24

ADSBExchange

Aircraft broadcast location at 1090 MHz.

Airport radar

Air traffic control radars usually operate in:

L-band (~1.2 GHz)

S-band (~2.7–2.9 GHz)

You can detect the pulse patterns easily with SDR.

Weather radar

Australia's Bureau of Meteorology radars typically operate around 2.7–3 GHz.

Your SDR will show repeating pulses when the radar rotates.

Satellite transmissions

With SDR you can receive:

NOAA satellites

Meteor weather satellites

Iridium satellites

GPS interference

### 3️⃣  Software to monitor radar or RF signals

These tools display spectrum and signals.

SDR visualization

Most common software:

SDR++

modern spectrum viewer

works on Windows/Linux/Mac

GQRX

popular Linux SDR receiver

CubicSDR

beginner friendly

They show a live spectrum waterfall like this:

Frequency →
████████████
█████ radar pulses
██ aircraft signals

### 4️⃣  Radar detection software

Some specialized tools exist.

Examples:

rtl_power

scans spectrum automatically

krakenSDR software

direction finding

inspectrum

analyze pulse timing

These let you measure:

pulse repetition frequency

radar scan timing

signal strength.

### 5️⃣  Software to share your receiver online

If you want your friends to see the spectrum live:

OpenWebRX (best option)

OpenWebRX turns your SDR into a web receiver.

Features:

anyone can listen in browser

waterfall spectrum

decoding modes

ADS-B display

Friends just visit:

http://your-ip-address:8073

OpenWebRX project:
https://github.com/jketterl/openwebrx

SpyServer (Airspy)

Another option.

You run a server and people connect using SDR software.

ADS-B maps

If you decode aircraft signals you can host your own map using:

tar1090

dump1090

This produces a live aircraft map in browser.

### 6️⃣  Example simple home setup

Many hobbyists run something like this:

Discone antenna on roof
        ↓
RTL-SDR
        ↓
Raspberry Pi
        ↓
OpenWebRX
        ↓
Friends view spectrum online

Cost roughly:

Item	Price
RTL-SDR	$50
antenna	$60
coax cable	$30
Raspberry Pi	$80

Total ≈ $200–250

### 7️⃣  Legal considerations (important)

In most countries (including Australia):

Allowed:

receiving radio signals

SDR listening

But not allowed:

decoding encrypted communications

rebroadcasting private communications

interfering with signals.

Airport radar monitoring is generally fine as passive listening.

✅ If you want, I can also show you:

- 1️⃣  A $150 SDR station that can detect Melbourne airport radar specifically
- 2️⃣  How people build global RF monitoring networks like ADS-B but for military
  signals
- 3️⃣  How to detect GPS jammers and radar activity automatically with scripts
  (very cool hobby project).

How would I find openwebrx websites on the web

There are a few good ways hobbyists find public OpenWebRX receivers online.
Most of them are listed in directories or maps.

### 1️⃣  ReceiverBook (best directory)

The most popular place to find them is ReceiverBook.

It’s basically a global directory of online SDR receivers.

Examples include:
- OpenWebRX
- KiwiSDR
- WebSDR

You can browse by:

frequency band

country

receiver type

location

👉 https://www.receiverbook.de

The site lists hundreds of publicly accessible receivers and links directly to
their web interfaces.

### 2️⃣  Global SDR maps

Another site shows a world map of SDR receivers where you can click and open
them.

Example map:

https://rx-tx.info/map-sdr-points

It lists thousands of receivers worldwide with their frequencies and URLs.

You can explore signals from different continents.

### 3️⃣  Google search trick

Many OpenWebRX servers use the default port 8073, so you can sometimes find
them with search queries like:

"OpenWebRX" 8073

or

inurl:8073 "OpenWebRX"

or

"OpenWebRX+" receiver

Because the interface usually runs at:

http://IP-address:8073
### 4️⃣  SDR community lists

Some ham-radio communities maintain lists of receivers.

Examples:

KiwiSDR public list

WebSDR list

OpenWebRX forums

These lists are often updated by people hosting receivers.

### 5️⃣  Examples of real OpenWebRX receivers

A typical receiver URL looks like:

http://109.164.114.15:8073/

or

http://204.235.44.74:8073/

Opening it shows:

waterfall spectrum

tuning controls

decoding modes

sometimes maps or satellite data.

### 6️⃣   What you can listen to on them

Depending on the antenna and SDR hardware, you might see:

shortwave radio

ham radio

aircraft communications

weather satellites

digital modes (FT8, WSPR)

sometimes ADS-B aircraft tracking

OpenWebRX supports many demodulation modes and SDR hardware devices.

✅ Tip:
If you want to explore radar or unusual RF signals, look for receivers that cover:

VHF / UHF / SHF

because most radar systems operate above 1 GHz.

👍 If you want, I can also show you something fun:

How people accidentally discover secret military signals or GPS jammers using
public SDR receivers.
There are some wild examples.
