# Pairing Stats

Look back at git commits to find programming pairs as identified by commit
messages as 1 of the following

  * a commit with a `:pear: @pair_handle`
  * a commit with a `🍐  @pair_handle`
  * a commit with committer text updated to include the pairs

Extend this to cross reference with users on trello cards.

Show pairing stats:

  * who pairs with who
  * style of pairing - number of commits, number of cards
  * who should pair with who next
  * who are the best pairs - for some subjective measure of best

## Development

* run tests

```
rspec
```

* run paring stats script

```
./bin/pairing_stats.rb

  usage

    ./bin/pairing_stats.rb <git repo directory> <git commiters names.yml>
```

with arguments
```
./bin/pairing_stats.rb <git repo directory> <git commiters names.yml>
pairing stats
```

