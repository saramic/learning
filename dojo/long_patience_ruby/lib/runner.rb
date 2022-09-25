# frozen_string_literal: true

require "deck"
require "space"
require "layout"

class Runner
  attr_reader :layout

  def initialize(output:, seed: nil)
    @output = output
    @deck = Deck.new(seed: seed).shuffle
    @layout = Layout.new
    @deck.each do |card|
      @layout.place_next(card)
    end
  end

  def play
    @output.puts @layout.to_s
  end
end
