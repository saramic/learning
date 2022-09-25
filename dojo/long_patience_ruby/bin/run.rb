#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << File.join(File.dirname(__FILE__), "../lib")
require "runner"
args = {output: Kernel}
args[:seed] = ARGV[0].to_i if ARGV[0] && ARGV[0] =~ /\d+/
Runner.new(**args).play
