#!/usr/bin/env ruby

require 'curses'


class Spiral
  DIRECTION = [
    :up,
    :right,
    :down,
    :left,
  ].freeze

  def initialize
    Curses.curs_set(0) # make invisible
    @window = Curses.init_screen
    @position = [@window.maxy/2, @window.maxx/2]
    @count = 0
    @change = @count
    @running = true
    @direction = DIRECTION[0]
    @snake = [@position]
    @length = 10
  end

  def run
    while running?
      Curses.setpos(*@position)
      Curses.addstr("😀")
      Curses.refresh
      tick
    end
  end

  private

  def tick
    if @position[0] == (@window.maxy - 2) && @direction == :down
      @direction = :right
    elsif @position[1] >= (@window.maxx - 4) && @direction == :right
      @direction = :up
    elsif @position[0] == 1 && @direction == :up
      @direction = :left
    elsif @position[1] == 1 && @direction == :left
      @direction = :down
    end

    case @direction
    in :up
      @position = [@position[0] - 1, @position[1]]
    in :right
      @position = [@position[0], @position[1] + 2]
    in :down
      @position = [@position[0] + 1, @position[1]]
    in :left
      @position = [@position[0], @position[1] - 2]
    end
    @snake << @position
    if @snake.count > @length
      Curses.setpos(*@snake.shift)
      Curses.addstr(" ")
      # Curses.refresh
    end
    sleep 0.05
    @count += 1
  end

  def running?
    @running
  end
end

spiral = Spiral.new
spiral.run

