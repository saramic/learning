#!/usr/bin/env ruby

require "curses"
require "base64"

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
    # start_char_fetching

    display_death_star
    while running?
      if @count % @window.maxy == 0
        #new_invader
        @position = [0,rand(@window.maxx)]
      end
      Curses.setpos(*@position)
      Curses.addstr("👾")
      Curses.refresh
      tick
    end
  end

  private

  def display_death_star
    contents = File.open(File.join(__dir__, "death_star_enc.rb")).read
    eval Base64.decode64(contents)
    logo = DeathStar::LOGO
    title = DeathStar::TITLE
    byline = DeathStar::BY_LINE

    start = [(@window.maxy/2) - (15/2), (@window.maxx/2) - (40/2)]
    Curses.setpos(*start)
    logo.split("\n").each do |line|
      Curses.setpos(start[0], start[1] + 16) # 16 offset
      Curses.addstr(line)
      start = [start[0] + 1, start[1]]
    end
    title.split("\n").each do |line|
      start = [start[0] + 1, start[1]]
      Curses.setpos(*start)
      Curses.addstr(line)
    end
    byline.split("\n").each do |line|
      start = [start[0] + 1, start[1]]
      Curses.setpos(*start)
      Curses.addstr(line)
    end
    Curses.refresh
  end

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
    @direction = :down

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
    end
    sleep 0.01
    @count += 1
  end

  def running?
    @running
  end
end

spiral = Spiral.new
spiral.run
