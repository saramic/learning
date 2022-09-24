# frozen_string_literal: true

require "deck"
require "space"

class Runner
  attr_reader :layout

  def initialize(output:)
    @output = output
    @deck = Deck.new
    @layout = {
      row1: {offset: 1, spaces: 14.times.map { Space.new }},
      row2: {offset: 2, spaces: 14.times.map { Space.new }},
      row3: {offset: 3, spaces: 14.times.map { Space.new }},
      row4: {offset: 4, spaces: 14.times.map { Space.new }},
    }
    row = 1
    row_index = 1
    @deck.each_with_index do |card, index|
      if @layout.find { |key, value| value[:offset] == row }.dig(1, :spaces, row_index)
        @layout.find { |key, value| value[:offset] == row }.dig(1, :spaces, row_index).place(card)
        row_index += 1
      else
        row += 1
        row_index = 1
        @layout.find { |key, value| value[:offset] == row }.dig(1, :spaces, row_index).place(card)
        row_index += 1
      end
    end
  end

  def play
    @output.puts @layout.dig(:row1, :spaces).map(&:to_s).join(" ")
    @output.puts @layout.dig(:row2, :spaces).map(&:to_s).join(" ")
    @output.puts @layout.dig(:row3, :spaces).map(&:to_s).join(" ")
    @output.puts @layout.dig(:row4, :spaces).map(&:to_s).join(" ")
  end
end
