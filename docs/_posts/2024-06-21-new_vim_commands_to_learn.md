---
layout: post
title:  "new VIM commands to learn"
date:   2024-06-21 07:35:00 +1000
categories: vim learning commands shortcuts
---

Watched a presentation at work on VI and worked out I should probably invest
some time into learning the following concepts.

- the characters `f` and `t` [stackoverflow](
  https://stackoverflow.com/questions/12495442/what-do-the-f-and-t-commands-do-in-vim)

  can look up help with `:h t` and `:h f`

  ````sh
  t{char}     Till before char

  f{char}     To occurrence of char, ie inclusive.
  ```

- use vim marks
  [https://www.reddit.com/r/vim/comments/df4jac/how_do_you_use_marks/](
  https://www.reddit.com/r/vim/comments/df4jac/how_do_you_use_marks/)
  - READ ABOVE ^^
- `cib` change inside brackets
    - [https://www.reddit.com/r/vim/comments/ps0py3/change_inside_nearest_object/](
      https://www.reddit.com/r/vim/comments/ps0py3/change_inside_nearest_object/)
    nominated session coverage!!!

- need to take another look at **vim registers**, in particular
  how to use a bunch of them -
  [https://www.brianstorti.com/vim-registers/](
  https://www.brianstorti.com/vim-registers/)


Finally I should get a vim **commenting** plugin like
- [https://github.com/tpope/vim-commentary](
  https://github.com/tpope/vim-commentary)

## Keyboard

also saw this NuPhy keyboard at work, low profile caps! I want!!!
[https://nuphy.com.au/products/nuphy-air60-v2?variant=48067508568369](
https://nuphy.com.au/products/nuphy-air60-v2?variant=48067508568369)

![](https://nuphy.com.au/cdn/shop/files/04.webp?v=1705984684&width=990
){: width="480"}

## show history in IRB

```ruby
Readline::HISTORY.to_a
```

or

```sh
cat ~/.irb_history
```
