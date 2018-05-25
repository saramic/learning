#!/usr/bin/env ruby

$LOAD_PATH << File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib')

require 'pairing'

git_repo_working_directory = ARGV[0]
git_committers_names_yml = ARGV[1]

unless git_repo_working_directory && git_committers_names_yml
  $stderr.puts <<-EOF
  usage

    ./bin/pairing_stats.rb <git repo directory> <git commiters names.yml>

  EOF
  exit(1)
end
pairing = Pairing.new(git_repo_working_directory, git_committers_names_yml)
pairing.stats($stdout)

