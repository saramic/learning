# Progress Dec 2024

## Idea for practicing gem and bundle

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

## Performance monitoring ruby

As per Advent of Code on [Ruby AU slack channel under #hackathons Dec 11th
10:15PM](
https://rubyau.slack.com/archives/CHHUB1VHD/p1733915773478149?thread_ts=1733908866.680359&cid=CHHUB1VHD)

Rian shared his approach [github/rianmcguire/aoc...](
https://github.com/rianmcguire/aoc/blob/8e2f73389e552add1c71eb49f35b2546a5a3d14d/perf.rb#L15)

```ruby
def measure(*cmd)
  if RUBY_PLATFORM.match /darwin/
    stdout, stderr, status = Open3
      .capture3("/usr/bin/time", "-l", *cmd)
    if status.exitstatus != 0
      raise "Failed: #{stdout} #{stderr} #{status.inspect}"
    end
    t = stderr.match(/([\d.]+) real/)[1].to_f
    max_rss = stderr.match(/(\d+).*maximum resident set size/)[1].to_f / 1024

    [t, max_rss]
  else
    stdout, stderr, status = Open3
        .capture3("/usr/bin/time", "--format", "%e,%M", *cmd)
    if status.exitstatus != 0
        raise "Failed: #{stdout} #{stderr} #{status.inspect}"
    end

    stderr.lines.last.split(",").map(&:to_f)
  end
end

files.each do |file|
  input = "#{file.split(".").first.gsub("b", "")}.txt"
  STDOUT.write label(file).ljust(max_length, " ")
  STDOUT.write " "
  t, max_rss = 3.times.map do
    STDOUT.write "-"
    measure("./#{file}", input)
  end.min_by { |t, max_rss| t }
  max_rss_mb = max_rss / 1024
  STDOUT.puts sprintf(" %6.3fs %5.1fMB", t, max_rss_mb)
end
```
