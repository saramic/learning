# elixir learning

 - [ ] basic tutorial
   http://elixir-lang.org/getting-started/introduction.html
   - [ ] http://elixir-lang.org/getting-started/basic-types.html
   - [ ] http://elixir-lang.org/getting-started/basic-operators.html
   - [ ] http://elixir-lang.org/getting-started/pattern-matching.html
     ^ pin operator
     matching against an existing varibles value rather then rebinding the value

   - [ ] http://elixir-lang.org/getting-started/case-cond-and-if.html
   - [ ] http://elixir-lang.org/getting-started/binaries-strings-and-char-lists.html
   - [ ] http://elixir-lang.org/getting-started/keywords-and-maps.html
   - [ ] http://elixir-lang.org/getting-started/modules-and-functions.html

    capture operator &

     - [ ] https://hexdocs.pm/elixir/Kernel.SpecialForms.html#&/1
    
    fun = &(&1 + 1)
    fun = fn x -> x + 1

   - [ ] http://elixir-lang.org/getting-started/recursion.html

     elixir recursion.ex
     elixir math.ex

   - [ ] http://elixir-lang.org/getting-started/enumerables-and-streams.html

     |> pipe operator more info

     - [ ] https://hexdocs.pm/elixir/Kernel.html#%7C%3E/2

     reminder of the ampersand notation
     Enum.reduce(1..3, 0, &+/2)
     Enum.reduce(1..3, 0, fn (a,x) -> a = a+x end) 
     Enum has .map .reduce .filter
     use Streams for lazy evaluation
     Stream has .map, .cycle, .unfold
     stream = File.stream!("path/to/file")
     Enum.take(stream, 10)

  - [ ] http://elixir-lang.org/getting-started/processes.html

    iex
    > 42 + 2

    elixir simple.exs

    .ex for code
    .exs for code as script
    elixirc math.ex to compile

 - [ ] following along with
      https://pragprog.com/book/elixir/programming-elixir

    elixir pmap.ex

