# Progress September 2026

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
