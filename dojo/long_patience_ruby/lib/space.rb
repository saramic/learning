# frozen_string_literal: true

class Space
  def initialize
    @card = nil
  end

  def to_s
    @card ? @card.to_s : "__ "
  end

  def place(card)
    @card = card
  end

  def pickup
    card = @card
    @card = nil
    card
  end

  def empty?
    !@card
  end
end
