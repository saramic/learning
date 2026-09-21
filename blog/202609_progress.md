# Progress September 2026

## Mon 21 Sep

### Light Gun

- **Finally... A Lightgun Worth Buying - Retro Dodo**

  [![
    Finally... A Lightgun Worth Buying - Retro Dodo
  ](http://i.ytimg.com/vi/ujIN9S5N61c/hqdefault.jpg)](https://youtu.be/ujIN9S5N61c)

# Samsung TV Apps, OSMC, and a DIY IR Light Gun

## 1. Samsung Tizen TV App Development

- **Stack:** Apps run in a Chromium-based web runtime — HTML5, CSS3, JavaScript
  against the Tizen Web API. Native C/C++ is possible for performance-critical
  work but far less common.
- **IDE:** Tizen Studio (Samsung's official Eclipse-based IDE) — includes a TV
  Simulator (software behavior), TV Emulator (hardware behavior), and Web
  Inspector (debugging).
- **Distribution:** Public releases go through Samsung's Developer Portal
  review (UI guideline compliance, content policy, API usage, device
  compatibility) — typically **7–20 business days**.
- **Input constraint:** Apps **must** be fully usable with the standard remote
  alone. Extra input devices (keyboard, controller, custom hardware) can be
  supported, but only as *optional* extras — never required. This applies to
  store-certified apps; sideloaded personal-use apps aren't bound by it.
- **Sideloading:** You can build and load your own app without going through
  store certification for personal use — Tizen is Apache 2.0 licensed and
  doesn't strictly require the official Studio if you follow packaging rules.

## 2. Samsung Tizen vs OSMC/Kodi

| | **Samsung Tizen** | **OSMC / Kodi** |
|---|---|---|
| Dev language | JS/HTML5 (or native C/C++) | Python (add-ons), C++ (binary add-ons) |
| Platform | Locked-down smart TV firmware | Full Debian Linux (typically Raspberry Pi) |
| Distribution | Store review, 7–20 days | No gatekeeper — install anything |
| Input | Remote-first; extra input must be optional | Fully open — bind any HID/USB/GPIO device |
| Hardware access | Sandboxed web runtime | Root access, GPIO, USB, serial all available |
| Best for | Reaching a public audience via Smart Hub | Hacking, custom hardware, full control |

**Bottom line:** if the goal is public distribution, Tizen's constraints are
real. If it's a personal/home project, sideloading an unlisted Tizen app or
just building on an OSMC/Kodi box instead removes almost all of them.

## 3. Why old CRT Light Guns Don't Work on LED/LCD

CRTs draw the image by scanning an electron beam across the screen. Old light
guns were just a photodiode: the game flashed the target white, and the gun
detected *the exact instant* the scanning beam passed its position — a timing
trick, not an imaging one. LED/LCD panels don't scan a beam the same way, and
processing latency (scaling, motion smoothing) destroys that timing
relationship — so this approach is a dead end on modern displays.

## 4. The Modern Approach: Camera-in-Gun + Fixed IR Emitters

**Correct geometry:** the camera goes *inside* the gun, pointing down the
aiming axis. Fixed IR LED emitters sit near the screen at known positions.

- Wherever the reference LEDs sit in the camera's field of view directly tells
  you the aim offset from center.
- This mirrors how a real gun sight/scope works, which is why it holds up.
- *(The reverse — fixed camera, IR emitter in the gun — can locate the gun in
  space but can't determine which way it's pointing, so it doesn't work for
  aiming.)*

This is the architecture used by all the major DIY/community projects:
**SAMCO**, **GUN4IR**, and **IR-GUN4ALL**.

### What the camera chip does
Most builds use a **PixArt IR sensor** (salvaged from a Wii Remote, or bought
standalone as the **DFRobot SEN0158**). It's a dedicated blob-tracker: over I2C
it reports the coordinates and brightness of up to 4 IR points in its frame.
The microcontroller converts those points into a screen (x,y) via calibration.

### Parts list
- Adafruit ItsyBitsy 32u4 / M0 / M4 (HID-capable microcontroller)
- DFRobot IR Positioning Camera (SEN0158), or a salvaged Wiimote sensor
- 4 IR LEDs (SFH 4547 recommended over stock Wii sensor bars for range),
  mounted near the screen
- Trigger switch + gun housing (toy shell or 3D-printed)
- USB connection to the host device

**Output:** the gun enumerates as a standard HID mouse/gamepad — works directly
with RetroPie/MAME/RetroArch, and would appear as a generic USB pointer to a
Tizen app too, without needing a custom Tizen input API.

### Tutorials, easiest → most advanced
1. **[Instructables – DIY Arduino Powered IR Light Gun
   (SAMCO)](https://www.instructables.com/DIY-Arduino-Powered-IR-Light-Gun/)**
   — most complete beginner build, full schematics and code.
2. **[GUN4IR](https://flatfootfox.com/a-look-at-the-gun4ir-light-gun/)** — more
   polished/customizable; moderately complex DIY project (mostly through-hole
   soldering).
3. **[IR-GUN4ALL (GitHub)](https://github.com/SeongGino/ir-light-gun-plus)** —
   most feature-complete fork: force feedback, off-screen reload detection,
   multiplayer.
4. **[henning2323/IR_LightGun
   (GitHub)](https://github.com/henning2323/IR_LightGun)** — worth reading for
   the pitfalls of the standard SAMCO calibration (tedious, input delay) and
   one author's rewrite for tighter accuracy.

### Payment zero

- I thought Christian of Monoova suggested cost of payments would go to zero?
  maybe not?

"payments will cease to be part of everyday life by 2030."
- https://www.monoova.com/blog/the-payments-revolution-how-we-will-pay-in-the-afterlife


# Free P2P Payment Collection App — Discussion Summary

## The idea

A free alternative to Eventbrite/GoFundMe-style collection tools for
fundraisers, trips, and group payments — no third party taking a cut. Organiser
sets up a "collection," each payer gets a unique reference, pays directly
bank-to-bank via a QR code, and the organiser gets notified automatically when
it lands.

## Why CDR isn't the entry point

CDR (Consumer Data Right) would let an organiser's bank account be *read* by
the app to confirm incoming payments automatically — but full ACCC
accreditation is disproportionate for a free side project:

| | Cost | Timeline |
|---|---|---|
| Unrestricted ADR (build + audit) | ~$100,000–$300,000 | 3–6 months to approval, assuming a complete application |
| Ongoing (fees, security program, EDR membership, insurance, ~1 FTE) | ~$100,000–$500,000/yr | ongoing |
| **CDR Representative** (sit under an accredited intermediary like Basiq/Adatree) | Usage-based fees, no accreditation cost | Faster — no ACCC process, just a commercial agreement |

**Conclusion:** full accreditation is off the table. CDR Representative is the
realistic *next step*, not the starting point, and even that adds delay and
cost that don't fit "free."

## What actually works today, for free: Up Bank

Up Bank has a free, public, personal developer API — no CDR needed:
- Personal access token, self-serve in-app
- **Webhooks** fire in real time on new transactions, including the payment
  reference field
- This is enough to build genuine auto-confirmation, today, at zero cost

**Westpac and Macquarie** have no equivalent free personal webhook/transaction
API for third parties. Their real-time notification products (e.g. Westpac
QuickStream) are business-banking services, not free consumer self-serve.
Access to their data as a third party is CDR-only.

**Practical scope for the PoC:** auto-confirmation works out of the box when
the *organiser* (money receiver) banks with Up. Everyone else gets a manual
"mark as paid" fallback — a real limitation to design around from day one, not
a blocker to building.

## The QR code mechanism

Australia has a published standard: **NPP QR Code Standard** (NPP Australia),
built on the **EMVCo Merchant Presented Mode (MPM)** QR format — the same
underlying spec used across Asia's scan-to-pay systems, adapted for PayID.

What the QR payload encodes:
- **Payload Format Indicator** + **Point of Initiation Method** (static vs.
  dynamic — use *dynamic*, since each payer needs a unique amount/reference)
- **Merchant/Payee Account Information** — the organiser's **PayID** (email,
  phone, or ABN), not raw BSB/account numbers
- **Transaction Amount** — pre-fills the exact amount owed
- **Additional Data Field (Bill Number / Reference)** — this is the field to
  put the **unique per-payer code** in. It's what your webhook matches against
  on the way back in
- **CRC checksum** for payload integrity

When scanned, the payer's banking app resolves the PayID to real account
details behind the scenes, pre-fills amount + reference, and the payer just
confirms. Nothing sensitive is printed on the code itself.

**Practical build note:** generate one dynamic EMVCo MPM QR per payer (or per
payment request) at collection-creation time, with the unique reference
embedded in the Bill Number field — that reference is the join key between "QR
was scanned/paid" and "webhook transaction arrived."

## Architecture (PoC)

- **Serverless** — Node.js/TypeScript on Cloudflare Workers or AWS Lambda
  (event-driven workload, no standing server needed)
- **Data store** — lightweight (D1 / DynamoDB / Supabase Postgres):
  collections, unique references, status
- **Payer-facing page** — static, shows amount + generates the EMVCo QR with
  embedded reference
- **Webhook receiver** — single endpoint, verifies Up's signature, matches
  amount + reference, flips status, notifies organiser
- No CDR/accreditation required for this phase

## Naming

"ZeroPay" is a no-go — collides with an existing Australian payments/EFTPOS
company (Zero Payments) and an existing BNPL app also called ZeroPay.
Alternatives floated: Straightpay, Nofee, PayThru, Kittyline, Refpay — still to
be checked for domain/trademark availability.

## Next steps

1. Build Up-only PoC: QR generation + webhook matching + manual fallback UI
2. Validate the reference-matching flow end-to-end with real Up transactions
3. If traction justifies it, evaluate a CDR Representative arrangement (via
   Basiq/Adatree) to extend auto-confirmation to Westpac/Macquarie users
4. Settle on a name and check availability

### Agentic AI

- https://jsonobject.com/claude-code-superpowers-agentic-coding
- https://github.com/Up-Coast/coast-standards/

> Engineering rules for software built with AI coding agents, and the checks
> that enforce them

### Model gun

- switch could come from a hand drill switch replacement [Aliexpress
  drill-switch](https://www.aliexpress.com/w/wholesale-drill-switch.html?spm=a2g0o.productlist.search.0)
- there are 3D printing options like [trigger mechanism of a
  RPG7](https://www.reddit.com/r/3Dprinting/comments/qzobrz/a_new_printed_assembly_i_just_made_the_trigger/)
- replacement spray bottle trigger [cleanlikeapro spray bottle
  trigger](https://cleanlikeapro.com.au/products/trigger?variant=46229338587307)
- https://en.wikipedia.org/wiki/FB_VIS_100
- https://en.wikipedia.org/wiki/Glock
- https://en.wikipedia.org/wiki/AK-47
- https://en.wikipedia.org/wiki/Comparison_of_the_AK-47_and_M16
- Cap guns and imitation weapons
    - https://www.capgunsaustralia.com.au/pages/faqs
    - https://www.capgunsaustralia.com.au/pages/permits-and-licenses
    - https://www.police.vic.gov.au/forms-and-applications
    - https://www.bigw.com.au/product/cap-gun-8-shot-caps/p/9902281271

### Image Recognition

- **Dunking on Elon by actually tracking Stealth fighters using cheap webcameras
without AI. #SoME4 - Consistently Inconsistent**

  [![
    Dunking on Elon by actually tracking Stealth fighters using cheap webcameras
    without AI. #SoME4 - Consistently Inconsistent
  ](http://i.ytimg.com/vi/zFiubdrJqqI/hqdefault.jpg)](https://youtu.be/zFiubdrJqqI)

- https://github.com/ConsistentlyInconsistentYT/Pixeltovoxelprojector
  - Projects motion of pixels to a voxel

Some mention of Theia on LinkedIn made me find this but probably unrelated

- https://github.com/sweeneychris/theiasfm
    - http://www.theia-sfm.org/
- https://github.com/rai-opensource/theia

Outdoor Millimeter-Wave Picocell Placement using Drone-based Surveying and Machine Learning
    - https://cse.sc.edu/~hregmi/pubs/conferences/McDowell_IEEE_ICCCN23_Theia.pdf

> Abstract—Millimeter-Wave (mmWave) networks rely on carefully placed small
> base stations called “picocells” for optimal network performance. However,
> the process of conducting site surveys to identify suitable picocell
> locations is both expensive and timeconsuming. The current low-cost
> approaches for indoor surveying are often unsuitable for outdoor environments
> due to the presence of various environmental factors. To address this issue,
> we present Theia, a drone-based system that predicts outdoor mmWave Signal
> Reflection Profiles (SRPs) and facilitates picocell placement for optimal
> network coverage. The drone platform integrates optical systems and a mmWave
> transceiver to collect depth images and mmWave SRPs of the environment. These
> datasets are fed into a machine learning model that maps the depth data to
> SRPs, allowing SRPs to be predicted at previously unseen parts of the
> environment. Theia then leverages these predictions to identify optimal
> picocell locations that maximize network coverage and minimize link outages.
> We evaluate Theia in three large-scale outdoor environments and demonstrate
> that the proposed design can generalize the deployment method with a little
> refinement of the model. Index Terms—Drone; Millimeter-Wave; Outdoor Picocell
> Deployment; Deep Learning

- https://theia.theaiinstitute.com/

### Comparing Cameras

Looking at the cameras I chose in the
https://github.com/saramic/learning/tree/master/competitions/202608-e14_road-test_open_call#create-your-roadtest-entry
being Ras Pi global shutter ones, how do they compare to something more
industrial like

Basler ace 2 Ra2A1920-51gmBAS
- https://www.baslerweb.com/fr-fr/shop/a2a1920-51gmbas/

or
Basler ace2 a2A1920-51gcBAS Color GigE Basic Camera
- https://www.edmundoptics.com.au/p/Basler-Ace2-a2A1920-51gcBAS-Color-GigE-Basic-Camera/44064

| Attribute | Pi GS Camera (SC0926 / IMX296) | Basler ace2 Mono (a2A1920-51gmBAS) | Basler ace2 Color (a2A1920-51gcBAS) |
|---|---|---|---|
| **Sensor / Resolution** | Sony IMX296, 1.58MP (1456×1088) | Sony IMX392, 2.3MP (1920×1200) | Sony IMX392 (color), 2.3MP (1920×1200) |
| **Pixel size** | 3.45 × 3.45 µm | 3.45 × 3.45 µm | 3.45 × 3.45 µm |
| **Frame rate (full res)** | ~60 fps | 51 fps | 51 fps |
| **Shutter** | Global | Global | Global |
| **HW trigger / sync** | Undocumented XTR pin — needs R11 removal + solder mod (your road test) | Native opto-isolated GPIO trigger, out of the box | Native opto-isolated GPIO trigger, out of the box |
| **Interface / cable run** | MIPI CSI-2 ribbon, ~1–2 m without repeaters | GigE (PoE), up to ~100 m | GigE (PoE), up to ~100 m |
| **Calibration data** | None published — no EMVA1288 characterization | EMVA1288 published: 62.2% QE, 71.7 dB dynamic range, 2.6 e⁻ dark noise | Same IMX392 family — EMVA1288 data available per-unit from Basler |
| **Price** | ~US$65 each | ~US$580–650 | A$678 (~US$440) |

### Drone kits

- [nxp.gitbook novergames drone kit](https://nxp.gitbook.io/hovergames/userguide/getting-started/drone-kit-contents#readytosky-lji-x4-500-quadcopter-frame-kit-with-carbon-fiber-landing-gear)

A fruit fly connectome as a drone pilot. Camera -> fly eyes -> spiking brain ->
descending neurons -> drone. Live 3D demo in your browser.
- https://github.com/SpikeCalls/FlyDrones

- Drone course notes https://vnav.mit.edu/

### AI tokens

Portal by Spotify cut my Claude Code token usage by 90%

- https://engineering.atspotify.com/2026/9/portal-by-spotify-cut-my-claude-code-token-usage-by-90
- https://github.com/spotify/portal-ai-plugins/

## Fri 11 Sep

Ran into an issue with TV not being able to play audio

The working file's audio is AAC 5.1 — nearly every smart TV decodes AAC
natively.

The broken file's audio is DTS 5.1 — most consumer TVs (including built-in
smart TV apps) don't have a DTS decoder license, so video plays but audio is
rejected as unsupported. (Video codecs differ too — HEVC vs H.264 — but both
play fine on your TV, so that's not the issue.)

Fix

Remux the container to keep video/subs as-is and just transcode the DTS audio
track to AC3 (Dolby Digital), which virtually all TVs support:

```sh
ffmpeg -i "original.mkv" \
  -map 0 -c:v copy -c:s copy \
  -c:a ac3 -b:a 640k \
  "original.fixed.mkv"
```

This is fast (no video re-encode) since it just remuxes video/subs and converts
the one DTS audio stream to AC3 5.1.

## Thu 2 Sep

## Animated GIF from video clip (time range)

```bash
ffmpeg -y \
  -ss 77 -to 86 \
  -i "input.mp4" \
  -vf "fps=10,scale=480:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
  output.gif

┌───────────────┬─────────────────────────────────────────────────────────────────────────────┐
│    Option     │                                   Meaning                                   │
├───────────────┼─────────────────────────────────────────────────────────────────────────────┤
│ -ss 77 -to 86 │ Start at 77s (1:17), end at 86s (1:26). Placed before -i for fast seeking   │
├───────────────┼─────────────────────────────────────────────────────────────────────────────┤
│ -vf "fps=10"  │ Output frame rate — lower = smaller file                                    │
├───────────────┼─────────────────────────────────────────────────────────────────────────────┤
│ scale=480:-1  │ Width 480px, height auto-calculated to preserve aspect ratio                │
├───────────────┼─────────────────────────────────────────────────────────────────────────────┤
│ flags=lanczos │ High-quality downscale filter                                               │
├───────────────┼─────────────────────────────────────────────────────────────────────────────┤
│ split[s0][s1] │ Splits stream into two for the two-pass palette approach                    │
├───────────────┼─────────────────────────────────────────────────────────────────────────────┤
│ palettegen    │ First pass: generates an optimal 256-colour palette from the footage        │
├───────────────┼─────────────────────────────────────────────────────────────────────────────┤
│ paletteuse    │ Second pass: applies that palette — much better colour quality than default │
└───────────────┴─────────────────────────────────────────────────────────────────────────────┘
```

> Size tuning: if over budget, reduce scale= width (e.g. 400, 320) and/or fps=
> (e.g. 8, 6).

---

Animated GIF — full clip

❯ let's make it go below 8mb

```sh
ffmpeg -y \
  -i input.mov \
  -vf "fps=10,scale=640:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
  output.gif

Same as above but no -ss/-to (whole file). Start wide (640px/10fps) then step down if over target size.
```

---

Web-ready MP4 from iPhone/iMovie (HDR stripping)

```sh
ffmpeg -y \
  -i input.mov \
  -vf "setparams=color_primaries=bt709:color_trc=bt709:colorspace=bt709" \
  -c:v libx264 -crf 28 -preset fast \
  -maxrate 1500k -bufsize 3000k \
  -pix_fmt yuv420p \
  -color_primaries bt709 -color_trc bt709 -colorspace bt709 \
  -c:a aac -b:a 128k \
  -movflags +faststart \
  output_web.mp4

┌───────────────────────────────────────┬──────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│                Option                 │                                                   Meaning                                                    │
├───────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ setparams=...bt709                    │ vf filter: rewrites colour space metadata in the video stream                                                │
├───────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ -color_primaries/trc/colorspace bt709 │ Output stream flags: strips HDR SEI metadata. Both vf AND these flags are required — one alone is not enough │
├───────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ -c:v libx264                          │ H.264 codec — universally supported in browsers                                                              │
├───────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ -crf 28                               │ Quality (lower = better). 18–28 typical range; 28 is good for web                                            │
├───────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ -preset fast                          │ Encoding speed vs compression trade-off                                                                      │
├───────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ -maxrate 1500k -bufsize 3000k         │ Caps bitrate to control file size                                                                            │
├───────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ -pix_fmt yuv420p                      │ Required pixel format for browser compatibility                                                              │
├───────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ -c:a aac -b:a 128k                    │ AAC audio at 128kbps                                                                                         │
├───────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ -movflags +faststart                  │ Moves metadata to start of file — enables progressive streaming                                              │
└───────────────────────────────────────┴──────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

> Why both setparams AND the output flags? iPhone records in Dolby Vision/HLG
> (BT.2020 HDR). Browsers encountering HLG metadata on H.264 will stop playback
> mid-video. setparams fixes the stream; the output flags strip the SEI —
> both are needed.
> 
> File size target: to hit a specific MB limit — targetMB × 8 /
> duration_seconds = total kbps, minus 128k for audio = video -maxrate. Then
> raise -crf (e.g. 32) to compress further.

---

Loop a video to fill a duration

```sh
ffmpeg -y \
  -stream_loop 11 \
  -i input.mp4 \
  -c copy \
  -t 3600 \
  output.mp4

┌─────────────────┬────────────────────────────────────────────────────────────────────────────┐
│     Option      │                                  Meaning                                   │
├─────────────────┼────────────────────────────────────────────────────────────────────────────┤
│ -stream_loop 11 │ Play input 12× total (original + 11 repeats). 3600 / 300 = 12 for 5min→1hr │
├─────────────────┼────────────────────────────────────────────────────────────────────────────┤
│ -c copy         │ Stream copy — no re-encode, instant and lossless                           │
├─────────────────┼────────────────────────────────────────────────────────────────────────────┤
│ -t 3600         │ Stop output at exactly 3600 seconds (1 hour)                               │
└─────────────────┴────────────────────────────────────────────────────────────────────────────┘
``` 

---

Transcribe audio with Whisper

```sh
pip install openai-whisper

whisper "meeting.webm" \
  --model small \
  --output_dir ./output \
  --output_format txt

┌─────────────────────┬─────────────────────────────────────────────────────────────────────────────────────────────┐
│       Option        │                                           Meaning                                           │
├─────────────────────┼─────────────────────────────────────────────────────────────────────────────────────────────┤
│ --model small       │ Model size: tiny (fastest), base, small (good accuracy/speed balance), medium, large (best) │
├─────────────────────┼─────────────────────────────────────────────────────────────────────────────────────────────┤
│ --output_dir        │ Where to write the transcript file                                                          │
├─────────────────────┼─────────────────────────────────────────────────────────────────────────────────────────────┤
│ --output_format txt │ Plain text output. Also supports srt, vtt, json, tsv                                        │
└─────────────────────┴─────────────────────────────────────────────────────────────────────────────────────────────┘
``` 

> First run downloads the model (~244MB for small). Subsequent runs use the
> cached model.
> FP16 not supported on CPU warning is normal on Mac — it falls back to FP32
> automatically.

---

Convert audio to small MP3 (speech)

```
ffmpeg -y \
  -i input.webm \
  -ac 1 \
  -b:a 32k \
  output.mp3

┌──────────┬──────────────────────────────────────────────────────────┐
│  Option  │                         Meaning                          │
├──────────┼──────────────────────────────────────────────────────────┤
│ -ac 1    │ Mono — halves file size vs stereo, fine for speech       │
├──────────┼──────────────────────────────────────────────────────────┤
│ -b:a 32k │ 32kbps bitrate — minimum listenable for speech; ~12MB/hr │
├──────────┼──────────────────────────────────────────────────────────┤
│ ```      │                                                          │
└──────────┴──────────────────────────────────────────────────────────┘
```
