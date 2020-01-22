#!/usr/bin/env ruby

$LOAD_PATH << File.join(File.expand_path(File.dirname(__FILE__)), "..", "lib")

require "game_of_life"

world = ARGV.join("\n")
puts world.inspect

puts "type 'q' to quit"
puts ""
puts world
while line = $stdin.gets
  world = GameOfLife.tick(world)
  puts world
  break if line.chomp == "q"
end
