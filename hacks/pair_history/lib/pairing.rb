require 'git'
require 'yaml'

class Pairing
  def initialize(git_working_directory, git_committers_names_yml)
    @git = Git.open(git_working_directory)
    @committers = YAML.load(File.open(git_committers_names_yml).read)
  end

  def stats(output)
    output.puts 'pairing stats'
    output.puts format_stats(generate_stats)
  end

  private

  def generate_stats
    [
      @committers.keys,
      pairing_by_day
    ]
  end

  def pairing_by_day
    []
  end

  def format_stats(stats)
    stats.map{|line| line.join(" | ") }.join("\n")
  end
end
