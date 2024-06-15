---
layout: post
title:  "15 June 2024 - average using bc"
date:   2024-06-15 10:50:00 +1000
categories: terminal bc average math
---

## Calculate average using bc

```sh
NUMBERS=(1 2 3 4 5 6 7 8 9 10) && \
    echo `bc <<< $NUMBERS` / ${#NUMBERS[@]} | bc -l

5.50000000000000000000
```

but not sure how to take `stdin` input

```sh
# THIS IS WRONG
repeat 3 { time sleep 0.1 } 2>&1 | \
    awk '{print $9}' | \
    xargs echo | \
    xargs -I {} bash -c \
    'NUMBERS=({}) && echo `bc <<< $NUMBERS` / ${#NUMBERS[@]} | bc -l'

# SEEMS to take 1 value but multiply it by 3?
.03633333333333333333
```

`awk` might be easier

```sh
repeat 3 { time sleep 0.1 } 2>&1 | \
    awk 'BEGIN{sum=0;count=0};{sum+=$9;count+=1}END{print sum/count}'

0.109333
```

## Using ruby

```sh
ruby -e 'ARGV.map(&:to_f).tap{|ary| puts ary.sum/ary.length }' \
    1 2 3 4 5 6 7 8 9 10

5.5
```

And to ready `stdin` output, to say do some stats

```sh
repeat 3 { time sleep 0.1 } 2>&1 | \
    awk '{print $9}' | \
    ruby -e \
    'ARGF.read.split("\n").map(&:to_f).tap{|ary| puts ary.sum/ary.length}'

0.10766666666666667
```
