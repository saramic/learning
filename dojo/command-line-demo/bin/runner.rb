#!/usr/bin/env ruby
# frozen_string_literal: true

Kernel.puts 'hello from runner'

$LOAD_PATH << File.join(File.dirname(__FILE__), '../lib')
require 'word_count'

Kernel.puts WordCount.new(ARGV)
