# Clock Hand Mirroring

A 12 hour clock has 60 positions for the minute hand, the hour hand has 12
times 60, equals 720 positions. This is under the assumption that the clock
movement moves the hour hand a little bit each minute. The aim is to find the
precise time, down to the minute, every time that the hour and minute hand are
mirror of each other with the clock divided vertically.

What about horizontally?

```
bundle exec guard 
```

## mirrored hour and minute hands

### Vertical

```{ruby}
$ ruby -I lib -e 'require "clock_mirroring"; puts ClockMirroring.mirror_times_for(0)'
00:00:00
00:55:25
01:50:50
02:46:10
03:41:35
05:32:20
06:27:45
07:23:05
08:18:30
09:13:55
10:09:15
11:04:40
```

### Horizontal

```{ruby}
$ ruby -I lib -e 'require "clock_mirroring"; puts ClockMirroring.mirror_times_for(90)'
00:27:45
01:23:05
02:18:30
03:13:55
04:09:15
05:04:40
06:00:00
06:55:25
07:50:50
08:46:10
09:41:35
11:32:20
```

