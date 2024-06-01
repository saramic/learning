# Quine clocks

Quine - output including the code

displaying a clock

## Javascript

- https://x.com/aemkei/status/1795573193559994505?s=46&t=zy7n_E0Lfgbfrer6yxPKBQ
- https://aem1k.com/qlock/

```
cat clock.js | pbcopy
# paste into console of browser
```

## Ruby

https://mametter.hatenablog.com/entries/2016/02/09

```
ruby clock.rb
```

would it be possible to do the JS style clock in ruby terminal?

```ruby
 ruby -e 'loop{puts "\033[2J" + Time.now.strftime("%H:%m:%S").split(":").
   map{|part| "\e[1;33m#{part}\033[0m" }.join(":"); sleep 1}'
 ```
