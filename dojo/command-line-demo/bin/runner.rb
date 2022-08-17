#!/usr/bin/env ruby
# frozen_string_literal: true

$LOAD_PATH << File.join(File.dirname(__FILE__), '../lib')
require 'word_count'
require 'distributed_word_count'

distributed = ARGV.delete('--distributed')
if distributed
  distributed_word_count = DistributedWordCount.new(ARGV)
  output = distributed_word_count.run.to_s
else
  output = WordCount.new(ARGV)
end
Kernel.puts output
