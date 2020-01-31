class GameOfLifeRegex
  LIVE = "*".freeze
  DEAD = ".".freeze

  def self.live?(cell_with_neigbours_string)
    !cell_with_neigbours_string
      .gsub("\n", "")
      .match(/^(#{"\\" + DEAD}*#{"\\" + LIVE}){3}#{"\\" + DEAD}*$/)
      .nil?
  end
end
