RubyVM::InstructionSequence.compile_option = {
  tailcall_optimization: true,
  trace_instruction: false
}

$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
require 'sum_tail_recursive'

number = ARGV.join.to_i
puts sum_tail_recursive(number, 0)
