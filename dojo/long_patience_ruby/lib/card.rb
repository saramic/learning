# frozen_string_literal: true

class Card
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s(type = :dark)
    return format("%s", @suit[type]) if type == :card

    format("%s%2s", @suit[type], @value)
  end
end
