# RSpec anti patterns

```
make
make test
make cop
```

## rubocop

```
make cop

bundle exec rubocop .
Inspecting 3 files
..C

Offenses:

spec/too_many_lets_spec.rb:7:1: C: RSpec/MultipleMemoizedHelpers: Example group
    has too many memoized helpers [10/5]
RSpec.describe TooManyLets do ...
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

3 files inspected, 1 offense detected
make: *** [cop] Error 1
```
