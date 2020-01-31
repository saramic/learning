class GameOfLifeRegex
  LIVE = "*".freeze
  DEAD = ".".freeze

  def self.live?(cell_with_neigbours_string)
    !cell_with_neigbours_string
      .gsub("\n", "")
      .match(/^(#{"\\" + DEAD}*#{"\\" + LIVE}){3}#{"\\" + DEAD}*$/)
      .nil? ||
    !cell_with_neigbours_string
      .gsub("\n", "")
      .match(/^(#{"\\" + DEAD}*#{"\\" + LIVE}){4}#{"\\" + DEAD}*$/)
      .nil?

    n = cell_with_neigbours_string.gsub("\n", "")
    n.match(/^(\.*\*){3}\.*$/) ||
      n.match(/^(\.*\*){3}\.*$/)&.send(:[], 0)&.match(/^.{4}\*/) ||
      n.match(/^(\.*\*){4}\.*$/)&.send(:[], 0)&.match(/^.{4}\*/)
  end
end
