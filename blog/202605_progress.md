# Progress May 2026

## Fri 15 May

```
ffmpeg -y -ss 5 -i big-bad-movie-in.mov \
    -an \
    -vf "setpts=PTS/1.5,setparams=color_primaries=bt709:color_trc=bt709:colorspa
  ce=bt709" \
    -c:v libx264 -crf 28 -preset fast \
    -maxrate 1500k -bufsize 3000k \
    -pix_fmt yuv420p \
    -movflags +faststart \
    output.mp4
```

What each part does:

Flag: -y
Effect: Overwrite output without prompting
────────────────────────────────────────
OPTIONAL
Flag: -ss 5
Effect: Skip the first 5 seconds of input
────────────────────────────────────────
OPTIONAL
Flag: -an
Effect: Strip audio entirely
────────────────────────────────────────
OPTIONAL
Flag: -af "atempo=2.0"
Effect: speed up audio by 2.0 (or 1.5 whatever to match video)
────────────────────────────────────────
Flag: setpts=PTS/1.5
Effect: Speed up video 1.5x by compressing timestamps
────────────────────────────────────────
Flag: setparams=color_primaries=bt709:color_trc=bt709:colorspace=bt709
────────────────────────────────────────
Flag: -c:v libx264
Effect: Encode to H.264
────────────────────────────────────────
Flag: -crf 28
Effect: Quality level (higher = smaller file, 28 is visually acceptable)
────────────────────────────────────────
Flag: -preset fast
Effect: Encoding speed/compression tradeoff
────────────────────────────────────────
Flag: -maxrate 1500k -bufsize 3000k
Effect: Hard bitrate cap to guarantee sub-10MB output
────────────────────────────────────────
Flag: -pix_fmt yuv420p
Effect: Standard pixel format for browser compatibility
────────────────────────────────────────
Flag: -movflags +faststart
Effect: Move metadata to the front of the file for instant playback
────────────────────────────────────────

> The key fix: Your iPhone 13 Pro records in Dolby Vision (HLG/BT.2020 HDR).
> Even after re-encoding to H.264, ffmpeg was carrying over the HDR color
> metadata. Browsers that encounter HLG metadata on an H.264 stream can stall or
>  stop decoding partway through — which is why you were only seeing the first
> ~6 seconds. The setparams filter overwrites that metadata to standard SDR
> (BT.709) before encoding.

✻ Cogitated for 1m 21s

※ recap: Converted iPhone video for Jekyll blog: trimmed 5s, muted, 1.5x speed,
  fixed HDR metadata causing 6-second browser stall. Test by hard refreshing the
   blog page to confirm full video playback. (disable recaps in /config)

### Adding backing track

Adding a backing track from x.mp3:

```
  ffmpeg -y -ss 5 -i /Users/michael/Downloads/IMG_2921.MOV \
    -i x.mp3 \
    -vf "setpts=PTS/1.5,setparams=color_primaries=bt709:color_trc=bt709:colorspa
  ce=bt709" \
    -af "atempo=1.0" \
    -map 0:v -map 1:a \
    -shortest \
    -c:v libx264 -crf 28 -preset fast \
    -maxrate 1500k -bufsize 3000k \
    -pix_fmt yuv420p \
    -c:a aac -b:a 128k \
    -movflags +faststart \
    output.mp4
```

Key additions:

┌───────────────┬─────────────────────────────────────────────────────────┐
│     Flag      │                         Effect                          │
├───────────────┼─────────────────────────────────────────────────────────┤
│ -i x.mp3      │ Second input — the backing track                        │
├───────────────┼─────────────────────────────────────────────────────────┤
│ -map 0:v      │ Take video from first input (the MOV)                   │
├───────────────┼─────────────────────────────────────────────────────────┤
│ -map 1:a      │ Take audio from second input (the MP3)                  │
├───────────────┼─────────────────────────────────────────────────────────┤
│ -shortest     │ Stop when the shorter stream ends (so video doesn't     │
│               │ hang waiting for a long MP3, or vice versa)             │
├───────────────┼─────────────────────────────────────────────────────────┤
│ -c:a aac -b:a │ Encode the MP3 audio to AAC for MP4 compatibility       │
│  128k         │                                                         │
└───────────────┴─────────────────────────────────────────────────────────┘

If the MP3 is shorter than the video and you want it to loop, add -stream_loop
 -1 -i x.mp3 (put the -stream_loop -1 before the -i x.mp3).

## Thu 14 May

- Van life or maybe initially car office and overnight travel

- Geoffery Huntley (as recommended by John Sherwood)
    - https://ghuntley.com/a-new-chapter/

    - inspiration

      **VAN TOUR | The Most Beautiful Camper Van Conversion Ever Made? - Jordan Osmond**
      [![
        VAN TOUR | The Most Beautiful Camper Van Conversion Ever Made? - Jordan Osmond
      ](
        http://img.youtube.com/vi/l-DgMYB6L0c/0.jpg
      )](https://youtu.be/l-DgMYB6L0c)

- google search for [setup in car to work on a computer](
  https://www.google.com/search?q=setup+in+car+to+work+on+a+computer&udm=2)
  - [https://www.mikaelajudd.com/how-to-create-a-remote-office-in-your-car/](
    https://www.mikaelajudd.com/how-to-create-a-remote-office-in-your-car/)
  - [https://www.reddit.com/r/priusdwellers/comments/mu9y1h/car_office_with_second_computer_display/](
    https://www.reddit.com/r/priusdwellers/comments/mu9y1h/car_office_with_second_computer_display/)
  - [Amazon Laptop Screen Extender 14", FHD 1080P Portable Monitor for Laptop,
    Light Monitor Extender Plug&Play, IPS Display Computer Monitor for Laptop
    13-17” (Screen Length: 11.81"-16.14") for Travel Work](
    https://www.amazon.com/dp/B0GJ9W9GXQ) ~$100

## Wed 13 May

- wrapped up watching

  **Null Object Pattern – Design Patterns (ep 18) - Christopher Okhravi**

  [![
    Null Object Pattern – Design Patterns (ep 18) - Christopher Okhravi
  ](
    http://img.youtube.com/vi/rQ7BzfRz7OY/0.jpg
  )](https://youtu.be/rQ7BzfRz7OY)

  - think about - how far can you move
    - replace every conditional and replace with polymorphism
    - and replace every NULL with plymorphism and NULL Object Pattern
  - [ ] watch this on Null Object Pattern

    **RailsConf 2015 - Nothing is Something - Confreaks**

    [![
      RailsConf 2015 - Nothing is Something - Confreaks
    ](
      http://img.youtube.com/vi/OMPfEXIlTVE/0.jpg
    )](https://youtu.be/OMPfEXIlTVE)

## Wed 6 May

### Good Developer Office setup

some inspiration for office space that works for developers from 2010

Microsoft - about 3min in they do a tour

- [https://web.archive.org/web/20200824072713/https://channel9.msdn.com/Blogs/Charles/Tour-Patterns-and-Practices-Lab](
  https://web.archive.org/web/20200824072713/https://channel9.msdn.com/Blogs/Charles/Tour-Patterns-and-Practices-Lab)
    - https://shapingsoftware.com/microsoft-patterns-practices-agile-workspace-tour/
- Campaign Monitor [https://www.youtube.com/watch?v=fEHC6DkNpRU](
  https://www.youtube.com/watch?v=fEHC6DkNpRU)


#### Microsoft p&p Agile Workspace — Found It

You're thinking of Microsoft's Patterns & Practices (p&p) team workspace. The
p&p team workspace was optimized for agile development and featured writeable
walls, configurable workspace, speaker phones, projectors, focus rooms, and a
customer room. Shaping Software

The blog post about it was written by Brian Kel on the Microsoft Learn archive
(originally from MicroNews, Microsoft's internal publication), titled
"Workspace of the Future: Is Writing on the Wall?" — and the author mentioned
wanting to get a Channel 9 video produced to show it off. Microsoft Learn

The Channel 9 video did eventually get made. The direct URL that was posted was:
https://channel9.msdn.com/Blogs/Charles/Tour-Patterns-and-Practices-Lab

Unfortunately, Channel 9 shut down in 2021 and older content migration was
uncertain — Microsoft said "most" content from after November 2017 would be
preserved, but older videos like this one are less certain. Archiveteam
Your best bet to find that video:

Try the Wayback Machine at
https://web.archive.org/web/*/https://channel9.msdn.com/Blogs/Charles/Tour-Patterns-and-Practices-Lab

Try the community Channel 9 index: https://walkingcat.github.io/ch9-index/ and
search for "patterns practices"

There's also a detailed photo tour with floor plans at:
https://shapingsoftware.com/microsoft-patterns-practices-agile-workspace-tour/
— this is the next best thing if the video is lost.


#### Campaign Monitor Sydney Office Video — Found It Too

You're right on the money. There is a YouTube video titled "The Campaign
Monitor office" with the description: "Take a tour of the brand new office we
moved into last month. Full blog post with pics at
campaignmonitor.com/blog/post/3242/the-new-campaign-monitor-office/" YouTube
The YouTube URL is: https://www.youtube.com/watch?v=fEHC6DkNpRU

The video is dated around August 2010. Whether it still has the exact "small
rooms of 3 devs" layout you're remembering I can't confirm without watching it,
but this is definitely the one. Medium

#### Other Good Developer Office Content

Here are some quality resources that aren't the usual loud open-plan nightmare:
**Atlassian Sydney HQ tour (circa 2010–2012)**
The iTnews photo gallery tour of Atlassian's early Sydney HQ shows Jira coders
at work with plasma screens tracking progress, a "Fish Bowl" meeting/time-out
room, and open but relaxed working areas for product teams. Good Sydney
context:
https://www.itnews.com.au/gallery/a-tour-of-atlassians-sydney-hq-237556 iTnews

**GitHub HQ** — mentioned in office design roundups as being designed with
flexibility and versatility with different environments for different working
styles. Worth searching YouTube for "GitHub office tour."

**Stack Overflow's NYC office** — they famously gave developers
private/semi-private offices and wrote extensively about why. Search for Joel
Spolsky's writings on this alongside any video tours.

**37signals/Basecamp** — Jason Fried has been vocal about calm, non-open-plan
work environments. Their Chicago office tours (search YouTube) reflect this
philosophy.

The p&p workspace blog/photo tour at shapingsoftware.com is probably the
richest single resource if you're trying to make a case for team rooms with
writable walls — it even has the floor plan.
