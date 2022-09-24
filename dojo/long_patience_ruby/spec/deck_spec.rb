# frozen_string_literal: true

require "deck"

RSpec.describe Deck do
  it "creates a deck of 52 cards" do
    expect(Deck.new.count).to eq 52
  end

  it "starts with Ace of Hearts" do
    expect(Deck.new.first.to_s).to match("♥ A")
  end

  it "finnishes with King of Clubs" do
    expect(Deck.new.last.to_s).to match("♠ K")
  end
end
