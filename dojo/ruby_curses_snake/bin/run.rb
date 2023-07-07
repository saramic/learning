#!/usr/bin/env ruby

require "curses"

class Spiral
  DIRECTION = [
    :up,
    :right,
    :down,
    :left
  ].freeze

  def initialize
    Curses.curs_set(0) # make invisible
    Curses.noecho # don't display typed characters
    @window = Curses.init_screen
    @position = [@window.maxy / 2, @window.maxx / 2]
    @count = 0
    @change = @count
    @running = true
    @direction = DIRECTION[0]
    @snake = [@position]
    @length = 10
  end

  def run
    start_char_fetching
    while running?
      Curses.setpos(*@position)
      Curses.addstr("😀")
      Curses.refresh
      tick
    end
  end

  private

  def start_char_fetching
    Thread.new do
      while (ch = Curses.getch)
        begin
          case ch
          when Curses::KEY_UP, "k"
            @direction = :up unless @direction == :down

          # Curses::KEY_DOWN is 258 ? not sure how this should work?
          # in this case we get 27[B ? left 27[C down 27[D up 27[A or is it ^[[A
          when Curses::KEY_DOWN, "j"
            @direction = :down unless @direction == :up
          when Curses::KEY_RIGHT, "l"
            @direction = :right unless @direction == :left
          when Curses::KEY_LEFT, "h"
            @direction = :left unless @direction == :right
          else
            # do nothing
            puts ch
          end
        rescue Curses::RequestDeniedError
          # do nothing
        end
      end
    end
  end

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
