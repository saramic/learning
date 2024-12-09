# Progress Dec 2024

## Idea for practicing gem and buld

this is the kind of thing I would do to get an understanding of `gem` and
`bundle` and `Gemfile` in terms of managing gems.

```sh
# get a quick squint overview of the tools
gem --help      # OR gem -h
bundle -- help  # OR bundle --help

# pick a gem to play with - say rexml (fast to install)
# see if you have it installed
gem list | grep -e ^rexml

# view where it is installed
gem info rexml

# install a couple of versions
gem install rexml --version 3.3.2
gem install rexml --version 3.2.7

# check what you have installed
gem list | grep -e ^rexml

# will output something like
rexml (3.3.2, 3.3.1, 3.2.8, 3.2.7, 3.2.6, 3.2.5)

# run a script to see which it uses
ruby -e "require 'rexml'; puts REXML::VERSION"

# now create a new folder for using bundler
mkdir demo
cd demo
cat Gemfile        # nothing there is no Gemfile, nor Gemfile.lock
ls

bundle init
cat Gemfile        # some default Gemfile

ruby -e "require 'rexml'; puts REXML::VERSION"
=> 3.3.9

bundle exec ruby -e "require 'rexml'; puts REXML::VERSION"
ERROR: cannot load such file -- rexml (LoadError)

# add a specific version of rexml to gemfile
bundle add rexml --version 3.2.5

# now
bundle exec ruby -e "require 'rexml'; puts REXML::VERSION"
=> 3.2.5

# but without the bundle
ruby -e "require 'rexml'; puts REXML::VERSION"
=> 3.3.9

cd ..
# remove the demo directory
```

practice for 5-10 minutes beginning of the day for a week (edited)
