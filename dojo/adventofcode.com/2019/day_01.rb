#!/usr/bin/env ruby

space_modules = ARGF.read.split("\n")
fuel = space_modules.map do |space_module|
  (space_module.to_i / 3).floor - 2
end
puts fuel.sum

