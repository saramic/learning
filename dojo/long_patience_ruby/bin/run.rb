#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << File.join(File.dirname(__FILE__), "../lib")
require "runner"
Runner.new(output: Kernel).play
