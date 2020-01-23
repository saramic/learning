#!/usr/bin/env ruby

$LOAD_PATH << File.join(File.expand_path(File.dirname(__FILE__)), "..", "lib")

require "game_of_life"

world = ARGV.join("\n")

system("cls") || system("clear")
puts world

while true
  system("cls") || system("clear")
  world = GameOfLife.tick(world)
  puts world
  sleep 0.2 
end
