# frozen_string_literal: true

require "card"

class Deck
  include Enumerable

  SUITS = [
    {
      name: :hearts,
      light: "♡",
      dark: "♥",
      cards: %w[🂱 🂲 🂳 🂴 🂵 🂶 🂷 🂸 🂹 🂺 🂻 🂼 🂽 🂾],
    },
    {
      name: :diamonds,
      light: "♢",
      dark: "♦",
      cards: %w[🃁 🃂 🃃 🃄 🃅 🃆 🃇 🃈 🃉 🃊 🃋 🃌 🃍 🃎],
    },
    {
      name: :clubs,
      light: "♧",
      dark: "♣",
      cards: %w[🃑 🃒 🃓 🃔 🃕 🃖 🃗 🃘 🃙 🃚 🃛 🃜 🃝 🃞],
    },
    {
      name: :sapdes,
      light: "♤",
      dark: "♠",
      cards: %w[🂡 🂢 🂣 🂤 🂥 🂦 🂧 🂨 🂩 🂪 🂫 🂬 🂭 🂮],
    },
  ]
  VALUES = %w[A 2 3 4 5 6 7 8 9 10 J Q K]

  def initialize
    @cards = SUITS.map do |suit|
      VALUES.map do |value|
        Card.new(suit, value)
      end
    end.flatten
  end

  def each(&block)
    @cards.each(&block)
  end

  def first
    @cards.first
  end

  def last
    @cards.last
  end

  def slice(*args)
    @cards.slice(*args)
  end
end
