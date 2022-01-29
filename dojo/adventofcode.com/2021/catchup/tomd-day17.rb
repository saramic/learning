#!/usr/bin/env ruby -Ilib

require 'vec2'

GRAVITY = Vec2[0,-1]
# target area: x=244..303, y=-91..-54
TARGET_X_RANGE=244..303
TARGET_Y_RANGE=-91..-54

def step(probe, v)
  probe2 = probe + v
  drag =
    case v.x
    when ->{_1.positive?} then Vec2[-1, 0]
    when ->{_1.zero?} then Vec2[0, 0]
    when ->{_1.negative?} then Vec2[1, 0]
    end

  [
    probe2,
    v + drag + GRAVITY,
  ]
end

def within_target?(probe)
  TARGET_X_RANGE.cover?(probe.x) && TARGET_Y_RANGE.cover?(probe.y)
end

def max_x_for_vx(x_velocity)
  probe = Vec2[0,0]
  velocity = Vec2[x_velocity,0]
  last_x = probe.x
  loop do
    probe, velocity = step(probe, velocity)
    break if probe.x == last_x
    last_x = probe.x
  end

  last_x
end

def steps_into_target?(initial_velocity)
  probe = Vec2[0,0]
  velocity = initial_velocity
  steps = [probe]
  loop do
    probe, velocity = step(probe, velocity)
    steps << probe
    if within_target?(probe)
      # puts "#{initial_velocity} stepped on #{probe} in #{steps.size} steps"
      return true
    end
    return false if probe.x > TARGET_X_RANGE.end
    return false if probe.y < TARGET_Y_RANGE.begin
  end
end

def min_vx
  @min_vx ||= begin
    vx = 0
    loop do
      break if max_x_for_vx(vx) >= TARGET_X_RANGE.begin
      vx += 1
    end
    vx
  end
end

MAX_VX = TARGET_X_RANGE.end + 1 # over shoots in a single step
MIN_VY = TARGET_Y_RANGE.begin - 1 # over shoots in a single step
MAX_VY = -MIN_VY # over shoots in a single step AFTER falling back down

total_good_vels = 0
(min_vx..MAX_VX).each do |vx|
  (MIN_VY..MAX_VY).each do |vy|
    total_good_vels += 1 if steps_into_target?(Vec2[vx, vy])
  end
end


pp (min_vx..MAX_VX)
pp (MIN_VY..MAX_VY)
puts total_good_vels
