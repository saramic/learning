require 'git'
require 'yaml'
require 'time'

class Pairing
  def initialize(git_working_directory, git_committers_names_yml)
    @git = Git.open(git_working_directory)
    @committers = YAML.load(File.open(git_committers_names_yml).read)
  end

  def stats(output)
    output.puts 'pairing stats'
    output.puts format_stats(generate_stats)
  end

  def pairing_by_day
    logs = @git.log(10)
    day_start = logs.last.date.to_date
    day_end = logs.first.date.to_date
    (day_start..day_end)
      .to_a
      .reverse
      .map{|day| { date: day }.merge(pairs_by_day(logs, day)) }
  end

  def pairs_by_day(logs, day)
    logs
      .find_all{ |log| log.date.to_date == day }
      .inject({}) do |pairs, log|
      author = committer_name(log.author.name)
      pairs[author] ||= [] if author
      handles = log.message.scan(/@\w+/)
      handles.each do |handle|
        pair = committer_name(handle)
        pairs[author] << pair if pair
        pairs[author]  = pairs[author].uniq
        pairs[pair] ||= []
        pairs[pair] << author
        pairs[pair] = pairs[pair].uniq
      end
      pairs
    end
  end

  def committer_name(handle)
    @committers.select{|name, handles| handles.include?(handle) }.keys.first
  end

  private

  def generate_stats
    stats = []
    stats << (["Date      "] | @committers.keys)
    pairing_by_day.each do |day_stat|
      stats << [
        day_stat[:date],
        @committers.keys.map do |committer|
          sprintf("%6s", day_stat[committer] || "-")
        end
      ]
    end
    stats
  end

  def format_stats(stats)
    stats.map{|line| line.join(" | ") }.join("\n")
  end
end
