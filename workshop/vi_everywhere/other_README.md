# VI on CLI

using vi on the command line

currently a bit of a rough draft of ideas to present at the ruby meetup
Melbourne Wed 27th June 2018
https://github.com/rails-oceania/melbourne-ruby/issues/103

## Draft

set -o vi

**Story:** how I came across this in the old day of installing linux distros from floppy

### Example - basic file based exploration

iterative deepening

- find a file
- less inside it
- extract some information
- get something from that information
- do something with it

#### what just happened?

- what vi commands have we covered
- how the hell do I get out of here
```
set -o

set -o | egrep 'emacs|vi '
emacs          	off
vi             	on

$ set -o emacs

set -o | egrep 'emacs|vi '
emacs          	on
vi             	off
```

### Example - taking it further

- do somehting based with output of 1 file?
- what is the infinite pipe example?

- work report example
  - generate a report
  - scp locally
  - and a new version of the file
  - diff them
  - expand diff to sort and limit output
  - pipe output to sort something out

## Example - sql terminal

**Story:** I promised eveywhere - what about in sql terminal? muscle memory was so strong that on random time I would get into vi mode in sql terminal - no idea how

- probably something along the lines
  - describe a table or 2
  - select some fields
  - do some group concat
  - join with another table
  - key is that I can jump around and modify query as need be

**Story:** so how do I get into vi mode? `<ESC>-<ENTER> <ESC>-<ENTER>` or set it as per tweet
  - https://twitter.com/saramic/status/332354236996272129
  - https://twitter.com/saramic/status/517103268715970562

  but there was another discussion around esc-enter x2

## Example - not a ruby talk unless I use ruby!

- irb
  - basic loop of loop example
  - or parse a file example and do something with the output - cheapest work tools?

- rails console?
  - ofcourse
  - explore a query to a model process it with another model
  - how to set it up, keys used also esc-enter x2

- binding.pry

- ruby on the command line?
  - sure
  - back to original examle (using history)

- other languages
  - clojure
  - 
**Story:** importance of history - no alias - no custom setup - great for pairing - great for on the server etc especially with latency


