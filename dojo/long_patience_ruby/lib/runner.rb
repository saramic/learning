# frozen_string_literal: true

require "deck"

class Runner
  def initialize(output:)
    @output = output
    @deck = Deck.new
  end

  def play
    output = @deck.each_with_index.map do |card, index|
      card.to_s + ((index + 1) % Deck::VALUES.length == 0 ? "\n" : " ")
    end.join("")
    @output.puts output
  end
end
