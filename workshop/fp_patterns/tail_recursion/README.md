# tail recursion

## Ruby

ruby ok for 1000

    ruby 01_sum.rb 1000

not so ok for 10_000

    ruby 01_sum.rb 10_000
    `sum_recursive': stack level too deep (SystemStackError)

This is due to too many frames on the stack

To help overcome this we can do sum_tail_recursion with the help of TCO (Tail
Call Optimization). This can be turned on in ruby, thanks to (Nithin
Bekal)[http://nithinbekal.com/posts/ruby-tco/] for code snippet, with the call

    RubyVM::InstructionSequence.compile_option = {
      tailcall_optimization: true,
      trace_instruction: false
    }

    ruby 02_sum_tail_recursive_main.rb 10_000

of course we know because of Gauss that the answer is really

ruby -e 'number = ARGV.join.to_i; puts number*(number + 1)/2'

## Scala

to run

    scala SumTailRecursive.scala 10000000

cannot seem to break even with some JAVA_OPTS

    env JAVACMD=java JAVA_OPTS="\
        -Xms64M -Xmx64M \
        -XX:MinHeapFreeRatio=10 -XX:MaxHeapFreeRatio=25" \
        scala SumTailRecursive.scala 10000000

shold have to add the `@tailrec` annotation????

## Clojure

## Elixir

## Javascript

