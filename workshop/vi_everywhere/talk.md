## VI everywhere

  "What's your super power"

  Michael Milewski @saramic twitter/github
  Developer at Fresho!


## Script

Wow, what a wonderful community we have in RORO Melbourne and Ruby Australia.
Thank you to the organisers! What an amazing event! and a great talk from
Selena, well done. A real story of strength and percevierence, and getting into
tech late gives you that feeling of always having to catch up. A real pleasure
to work with people of this strong character at Fresho!.

And what a diverese grou we are!
I am honoured to present here.
What a diverse group we are. Yeah I am sure we have a long way to go but 66%
females talking today! wow! You know the other the day went to a meetup and it
was so mono culture! everyone was the same sex, white, priveleged female
[photo]
yeah there I am at a knitting meetup the only male :) - that is the 9th of June
2018 world wide knit in public day
[no photo]
No but in all honesty, I did go to a tech meetup recently and this particular
group of hackers really lacked diversity, diversity of opinions, of solving
problems, all white males. Maybe I recall a ruby meetups and rails camp 10
years ago like that but we have come a long way. And by the way I learnt
knitting at a camp JS and cemented my skills at a rails camp. Sometimes sharing
things other then code can lead to sharing more about code.

Onto my talk. For ever I have wanted to do a technical talk, I have done agile
transformation talks and team transformations for re-platforming as well as
learning talks but never anything purely technical. I premepted the talk with
how wonderful the community is so that you can all give me a bit of a pass if I
mess things up on this topic.

Vi - who uses it day to day?

Who uses Vim day to day and is upset that I called it Vi?

Who has no idea what Vi is?

General note:
  The aim of this talk is to show all of us that a RubyMine using shlep like me
  can get huge productivity and satisfaction from about 10-20 Vi commands, and
  maybe challenge the Vim users that using vi outside of the editor is worth a
  try.

I presume a large precentage of us know only one vi command and that is `:q`
quit get me out of here. I believe the most upvoted answer on stack overflow.

To up the ante on the technical talk there will be live code demonstration and
this cool mechanical keyboard. It is so tchnical they have forgotten to put
arrow keys on it, Arrrrghhh! Not that the size of the arrow keys on the Mac
book pro is anything to write home about. Nor lack of escape key.

people who get stuck in vi search for how to get out using :q

people who buy keybaords without arrow keys look for extension keyboards to
provide the arrows

[SLIDE: picture num pad]

No, it has been 6 months now and I am starting to get used to it.

So there once was a line editor named ex, E X, Does anyone know what a line
editor is? yeah before we had graphical screen we would have teleprinters,
basically a printer attached to a key board the printer would show you what you
have so far written and then you could type a 1 line command to change existing
lines. The ex editor had a visual mode for when it is connected to a graphical
display

it is this visual mode that is the inspiration for an editor that is named by
the shortest unambiguous abreviations

[JUMP TO VIMDECK PRESENTATION]
[SLIDE: VI = VIsual]

at some time the editor got updated to

[SLIDE: VIM = Vi IMproved]

and these little tricks of

[SLIDE: shortest unambigous abreviation
        vi = visual

        line by line editing ]

Is what we will explore today. So let's get started

let's say you came across this talk as a markdown file in a directory.
  ```
  ls
  talk.md
  ```
Let's see the whole directory.
  ```
  echo `pwd`/talk.md | pbcopy
  ```
[TURN ON WHICH KEY I PRESS ^⌥ ⌘ k]
Next you want to see what is in the file. You now have a few options,
1. `less` the file and re type the path,
1. `less` cut and paste the path and less the file (but that would be using the
   mouse and if you are using the mouse you are probably doing it wrong)
1. you can up arrow and then left arrow till you get to the beginning of the
   line then delete the `ls` and write `less`. But moving left character by
   character is so slow, I have seen people setup new computers and one of the
   first things they change is increase the speed of their cursor!

   Don't do that, remember DRY - Don't Repeat Yourself, if you have to do it
   more then 3 times, there must be a better way, we are programmers, if there
   is no better way then create one!

1. and oh oh some of you are going to say hit <CTRL>-A to go to the beginning
   of the line.

   What?  shortcuts on the command line? where did CTRL-A come from? is it used
   in an editor somewhere? oh yeah EMACS! so hang on if I can go to the
   beginning of the line surely
   * I can go to the end of the line with EMACS' <CTRL>-E yup
   * and then can I jump back a word with EMACS' <CTRL>-b
   * and forward a word with <CTRL>-f
   * and and, I am sure there are more EMACS commands but we are talking vi
     here, right?

so what is going on? well Bash running in your terminal has EMACS as the defalt
editor turned on

  ```
  set -o | egrep 'vi |emacs'
  emacs          	on
  vi             	off
  ```

and in fact in EMACS:
* UP ARROW is to go up a line
* DOWN ARROW is to go down line.
stupid keyboard with no arrow keys

if I unset emacs as a shell option

  ```
  set +o emacs
  set -o | egrep 'vi |emacs'
  emacs          	off
  vi             	off
  ```

now we do not have emacs turned on so pressing up arrow blows up <CTRL>-R for
reverse search, also blows up, it actually prints the <CTRL>-R because your
reverse search comes from emacs. So this brings us to the other option i have
been showing, what heappens if we `set -o vi` ? You guessed it we are in VI
mode.

So now I add another option to less that file whos path we have in our history,
1. I can press <ESC> to put VI into `normal mode` which means I can use the `k`
   character to move up a line. Now I am on the beginning of the line and I
   again want to "change a word" so using the shortest unambiguous
   abbreviation, `cw` which puts me in `insert mode` I want to type `less`
   which allows me to less the file and see what is inside.

I see that the slides seem to be split by markdow with two # (hash) symbols. Ah so let's say I
want to now find out home many slides this Michael character has before we can
go home? so
* I quit out of less `q`
* I `ESC` and `k` to go up to the previous line
* and `cw` to `cat` and `ESC` to get back to normal mode
* then I jump to the end of the line with the vim and regular expression symbol
  `$` (dollar)
* here i want to append? what is the shortest unambiguous abreviation for that?
  you guessed it `a` so we append `| grep \#\#` I need to escape the `#` in
  grep and we see, ahh not too many slides
* let's count them, 1, 2, 3 I am repeating myself, there must be an easier way?
* `ESC k` for last command and this time I want to "append to the end" so like
  `a` so like a big append so we press `SHIFT-A` to append at the end of the
  line.
* And we pipe into word count by line `wc -l` again a lot of unix tools use
  shortest unambiguous abreviation and we have the number of slides - cool

so what have we learnt so far?

[SLIDE
  set -o vi     # get into vi mode
  ESC           # go into "normal mode"
  k             # go up a line
  cw            # change a word
  a             # append after the cursor
  A             # append at the end of the line]
  ^             # go to begninning of line (just like regex)
  $             # go to end of line (just like regex)

  set -o emacs  # get me out of here
  ]

And we did this in the command line in an "iterative exploratory way" we
[SLIDE
  1. found a file
  1. looked inside it
  1. greped for content
  1. passed that to a line count tool
  ]

And often we do just that, iterative everything.
1. Iterartive delivery in Agile
1. Iterative development in Test Driven Development (TDD)
1. and here iterative exploration on the command line

Often we do iterative learning and deepening. Each time we return to a topic we
find it eaier to reach a level we have attained in the past and this often
means we go deeper a second time and deeper again a third time and so on. This
toy example saw us do this on a micro scale where we went back to a file and
learnt more about it each time. Now we are going to apply this to learning this
vi technique let's look at another example.

## Another command line example

so let's say we are investigating processesses on a machine we may start with
`ps -ef`
and let's say like Mel talked about docker we got all carried away with too many docker containers so we try to find thme
`ps -ef | grep docker` keys `ESC-k SHIFT-A`
and I want only the first result

##### TODO ######
 - infintie pipe like
 - something with docker
 - something with more mistakes to show new commands

so let's review what we have learnt here

[SLIDE
  c7w           to cut 7 words
  ct<charcter>  to cut to a give character
  W             word jump forward to whitespace
  b             back jump a word
  B             back jump a word to whitespace
  ]


## I promised vi everywhere

I have been sitting back for many years, probably
like a lot of you are and thinking, "hmm I have a couple of talks up my sleeve, if only I had time and this and that ... then maybe one day I may be
up here ..." Well finally I am here.

## Fresho!

A web app connecting fresho food suppliers and restaurnats

  * super sticky usage - chef's use it daily
  * startup where features released every week actually make a marked difference to users
  * Focus on testing - we have 6 distinct layers of testing but that is another talk
  * focus on pairing
  * WIP limits on our board mean we actually do 25% tech improvmements - quality and reliabilty driven


## VI everywhere

  "What's your super power"

  1. VI basics
  1. VI everywhere
  1. What is your super power?
  1. Daily dojo - the simple path to learning a new super power


## VI basics

who knows vi?
vi based on the visual mode of a line editor called ex. vi being shortest
unambiguous for ex command visual. Line editors were popular prior to video
displays basically a printer. since them improvements like VIM vi improved etc.

modal editor with either insert mode or normal mode


## VI Basic commands

Insert mode
  i insert
  I insert at begging of the line
  a append after current character
  A append at end of the line
  o open new line for inserting
  O open line above for inserting
normal mode
  ESC go to normal mode


## VI Basic commands

movements
  h right
  j down
  k up
  l left
  w move word forward
  w4 move 4 words forward
  W move whitespace word forward
  W4 move 4 whitespace words forward
  b move word back
  ^ beginning of line (like regex)
  $ end of line (like regex)
  gg go top
  G go to bottom
  u up
  d down


## VI Basic commands

editing
  x delete a character
  X delete previous character
  u undo
  cw change a word
  c4w change 4 words
  ct. change to '.' character
  yw yank (copy) word
  y4w yank 4 words


## VI Basic commands

extras
  / search for a term


## VI on the command line

set -o vi

typical use case iterative exploration
find a file
copy the file
view the file
do some kind of processing to the file

Use case 2

Use case 3

Use case 4 searching

Use case 5 what if you want ruby?

ruby -e ....
iterative exploration

VI everywhere

irb

rails console


mysql console

postgresql console
https://twitter.com/saramic/status/332354236996272129
just got a 100x speed improvement in my ruby irb
set editing-mode vi
and
cat >> ~/.editrc
bind -v
http://stackoverflow.com/questions/6636124/how-do-i-make-vi-editing-mode-work-in-irb-when-using-rvm …

2:39 PM - 9 May 2013

https://twitter.com/saramic/status/517103268715970562
just quadrupled my productivity by adding "bind -v" to my .editrc file http://stackoverflow.com/questions/2216471/how-to-get-vi-keybindings-to-work-in-mysql-client …

10:06 AM - 1 Oct 2014

ESC ENTER ESC ENTER

In fact any readline program

cluedo and/or scrabble

I said everywhere so let's do the browser
run through script


just got a 100x speed improvement in my ruby irb
set editing-mode vi
and
cat >> ~/.editrc
bind -v
http://stackoverflow.com/questions/6636124/how-do-i-make-vi-editing-mode-work-in-irb-when-using-rvm …

2:39 PM - 9 May 2013

all the other languages
lein repl # YES for coljure
python    # YES for python
iex # NOPE don't use elixir
rust ??

**Good**
- irb puts "hi"
  ^D
- python3 print("hi")
  ^D
- lein repl
  (print "hi")
  ^D

**No good**
- node console.log('hello from node')
  ^D
- iex  IO.puts "hello elixir"
  ^C a

rlwrap

## What is your super power?

  1. VI basics
  1. VI everywhere
  1. What is your super power?
  1. Daily dojo - the simple path to learning a new super power


## Daily dojo

quote on validty
like practicing scales
martial arts routines
even things like pushups
even if it feel cargo cultish - it is ok! experience will lead to enlightment and learning no experience leads to idle chit chat


## Daily dojo for vimium plugin

examples
tdd
framework/script setup
tmux commands
these vi commands

## turn off vi mode

set -o emacs
set -o (to list)

emacs commands
CTRL-A go to beginning of the line
CTRL-E go to end of the line
       jump word
       delete words

Choose your muscles you want to flex, parctice it with daily dojo and gain a super power


## Learning

    “ Live as if you were to die tomorrow. Learn as if you were to live
      forever.”
                                                              ― Mahatma Gandhi

