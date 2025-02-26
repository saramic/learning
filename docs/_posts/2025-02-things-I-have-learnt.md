---
layout: post
title:  "Feb 2025 - things I have learnt"
date:   2025-02-01 09:00:00 +1100
categories: learning update
---

## Which processes are listening on a port

- say port 3000

```shell
lsof -t -i:3000 | xargs -I {} ps aux {}
```

the `-I {}` will template the value from the stream into `{}` rather than
passing all values to the `xargs` command

## Send an email with rails runner

- to test if things like `letter_opener` gem are configured to open emails in a
brower

```shell
bin/rails runner 'ActionMailer::Base.mail( \
  from: "m@m.m", to: "y@m.m", subject: "test", body: "test").deliver'
```

## issue with bundler speed and reshimming under ASDF

as discussed in [RubyAU slack](
    https://rubyau.slack.com/archives/C0QL0SNGG/p1740002824487709?thread_ts=1739948986.554959&cid=C0QL0SNGG)

- in particular if you have many ruby versions installed
- also an ASDF alternative was mentioned, mise -> https://mise.jdx.dev/

> right got you - so if anyone else wants to follow along at home here is the
> thing

```shell
# uninstall a dependency of your project and bundle
gem uninstall --all --ignore-dependencies jwt
time bundle
# DEFAULT SLOW TIME 33 seconds
bundle  6.24s user 9.50s system 47% cpu 32.899 total
```

```shell
# HACK/comment out the reshim, uninstall and get a time improvement
sed -i .old \
  's/  Bundler::Installer.prepend ReshimInstaller/  #Bundler::Installer.prepend ReshimInstaller/' \
  ~/.asdf/plugins/ruby/rubygems-plugin/rubygems_plugin.rb
grep ReshimInstaller ~/.asdf/plugins/ruby/rubygems-plugin/rubygems_plugin.rb
gem uninstall --all --ignore-dependencies jwt
time bundle
# FASTER TIME WITH HACK 6 seconds
bundle  3.00s user 0.52s system 57% cpu 6.071 total
```

```shell
# reset the HACK/comment out reshim
sed -i .old \
  's/  #Bundler::Installer.prepend ReshimInstaller/  Bundler::Installer.prepend ReshimInstaller/' \
  ~/.asdf/plugins/ruby/rubygems-plugin/rubygems_plugin.rb
grep ReshimInstaller ~/.asdf/plugins/ruby/rubygems-plugin/rubygems_plugin.rb
```

## git mob

```shell
npm install --global git-mob

# allow to fetch from github
git config --global git-mob-config.github-fetch true

# note case sensitive
git mob saramic

# check the co-authors and change key for easy access
cat ~/.git-coauthors
```

## check if YJIT is enabled in rails

```shell
bin/rails runner 'puts RubyVM::YJIT.enabled?'
```

- usually would need to do something like

```shell
# assumint asdf https://asdf-vm.com
asdf plugin add ruby
asdf plugin add rust
# may need to uninstall if it was installed with YJIT
asdf uninstall ruby 3.3.6
# install
RUBY_CONFIGURE_OPTS=--enable-yjit  asdf install ruby 3.3.6
```

- check install in ruby

```shell
# in ruby
ruby -v
ruby 3.2.2 (2023-03-30 revision e51014f9c0) +YJIT [arm64-darwin23]
ruby --yjit -v
ruby 3.2.2 (2023-03-30 revision e51014f9c0) +YJIT [arm64-darwin23]

RUBYOPT="--yjit" ruby -e 'puts RubyVM::YJIT.enabled?'
true
ruby -e 'puts RubyVM::YJIT.enabled?'
true
```

- and in rails

```shell
# check it's installed in rails
RUBY_YJIT_ENABLE=1 bin/rails runner 'puts RubyVM::YJIT.enabled?'
```

## run osascript to generate a notification

```shell
osascript -e \
  'display notification "demo a notification" with title "Hello 🛎️🛎️" sound name "Bell"'
```

- [ ] but how do I list the valid sound names?
- [ ] and how do I action any notifications as they come in from other apps?
    - [ ] https://apple.stackexchange.com/a/402564

## resize image with imagemagick

```shell
magick large-image.jpg -resize 1200x1200 reduced-image.jpg
```

## amend a git commit date

```shell
git log
commit d91ac6a7d018877c94705b431710f98d9f040c70 (HEAD -> main, origin/main)
Author: Michael Milewski <saramic@gmail.com>
Date:   Sat Feb 8 08:08:08 2025 +1100

    Some commit message

# do the following
git commit --amend --date="Sat Feb 9 09:09:09 2025 +1100" --no-edit
```

## compress movie with FFMPEG

- just pass old movie, like a QuickTime movie, and it will be more effectively compressed

```shell
ffmpeg -i existing-movie-name.mov new-movie-name.mp4
```

## directly open Cypress in E2E or component mode

- by specifying the browser and the type of tests

```shell
# open via npx
npx cypress open --browser chrome --e2e
npx cypress open --browser chrome --component

# or run against a target in package.json
npm run cypress:open -- --browser chrome --e2e
npm run cy:open -- --browser chrome --e2e
```

## install specific version of NPM

- when a project depends on it

```shell
npm install -g npm@10.9.2
# or
npm install --global npm@10.9.2
```
