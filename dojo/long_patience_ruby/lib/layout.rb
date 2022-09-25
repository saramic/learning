# frozen_string_literal: true

require "space"

class Layout
  def initialize
    @layout = {
      row1: {offset: 1, spaces: 14.times.map { Space.new }},
      row2: {offset: 2, spaces: 14.times.map { Space.new }},
      row3: {offset: 3, spaces: 14.times.map { Space.new }},
      row4: {offset: 4, spaces: 14.times.map { Space.new }},
    }
    @current = {row: 1, row_index: 1}
  end

  def to_s
    @layout.dig(:row1, :spaces).map(&:to_s).join(" ") + " |\n" +
      @layout.dig(:row2, :spaces).map(&:to_s).join(" ") + " |\n" +
      @layout.dig(:row3, :spaces).map(&:to_s).join(" ") + " |\n" +
      @layout.dig(:row4, :spaces).map(&:to_s).join(" ") + " |"
  end

  def place_next(card)
    space = @layout.find { |key, value| value[:offset] == @current[:row] }.dig(1, :spaces, @current[:row_index])
    space.place(card)
    if @layout.find { |key, value| value[:offset] == @current[:row] }.dig(1, :spaces).length - 1 == @current[:row_index]
      @current[:row_index] = 1 # actually find next empty +1
      @current[:row] += 1
    else
      @current[:row_index] += 1 # actually find next empty +1
    end
  end

  def dig(*args)
    @layout.dig(*args)
  end
end
