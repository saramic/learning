#!/usr/bin/env ruby

$LOAD_PATH << File.join(File.expand_path(File.dirname(__FILE__)), 'lib')

require 'enhancer'

include Enhancer

def finger_print_to_a(finger_print)
  finger_print.split('/').map(&:chars)
end

img = finger_print_to_a(".#./..#/###")
rules = ARGF.read.split("\n").inject({}) do |hash, line|
  key, value = line.split(" => ")
  hash[key] = value
  hash
end
puts rules.inspect
puts img.inspect

def pixel_count(img)
  img.flatten.find_all{|p| p == '#'}.count
end

def process(sub_imgs, rules)
  sub_imgs.map do |sub_img|
    match = finger_prints(sub_img).find do |finger_print|
      puts [sub_img, finger_print].inspect
      rules.keys.find{|k| k == finger_print}
    end
    match ? finger_print_to_a(rules[match]) : sub_img # no match should never happen
    #finger_print_to_a(rules[match])
  end
end

def pprint(img)
  img.each{|line|
    puts line.join
  }
end

pprint img
(1..5).each do |iter|
  sub_imgs = split_into_sub_images(img)
  #puts 'the sub imgs for iteration'
  #puts sub_imgs.inspect # process
  new_sub_imgs = process(sub_imgs, rules)
  #puts sub_imgs.inspect # process
  #puts 'before'
  #puts img.inspect
  img = combine_sub_images(new_sub_imgs)
  #puts 'after'
  #puts img.inspect
  pprint img
  puts pixel_count(img)
end
puts pixel_count(img)
