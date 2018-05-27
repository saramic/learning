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
    output.puts text_format_stats(generate_stats)
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
      authors = (log.author.name || '').split(' + ').map do |author_name|
        committer_name(author_name)
      end
      authors.each do |author|
        pairs[author] ||= []
      end
      handles = log.message.scan(/@\w+/).map{|handle| committer_name(handle) }
      (authors + handles).each do |pair|
        authors.each do |author|
          pairs[author] << pair if pair
          pairs[author] << authors
          pairs[author]  = pairs[author].flatten.reject{|a| a == author}.uniq
        end
        pairs[pair] ||= []
        pairs[pair] << authors
        pairs[pair] = pairs[pair].flatten.reject{|p| p == pair}.uniq
      end
      pairs
    end
  end

  def committer_name(handle)
    @committers.select{|name, handles| handles.include?(handle) }.keys.first
  end

  def text_format_stats(stats)
    col_widths = stats.each_with_object({}) do |line, counts|
      line.each_with_index do |field, index|
        counts[index] = [(counts[index] || 0), field.to_s.chars.length].max
      end
    end
    stats.map{|line| line.each_with_index.map{|field, index| sprintf("%#{col_widths[index]}s", field)}.join(" | ") }.join("\n")
  end

  private

  def generate_stats
    stats = []
    stats << (["Date"] | @committers.keys)
    pairing_by_day.each do |day_stat|
      stat_line = []
      stat_line << day_stat[:date]
      @committers.keys.each do |committer|
        stat_line << (day_stat[committer] || "-")
      end
      stats << stat_line
    end
    stats
  end
end
