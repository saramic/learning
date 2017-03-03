# Advent MD5

As day 5 of advent calendar at RC the reuirement was to solve a puzzle
involving brute forcing md5 hashing.

Given a key `abbhdwsy` find the first 8 md5 hashes of that key and a counter
0..infnity that start with `/^00000/` then use the 6th character to create a
"code"

This would lead to
    0..1739529..1910966..1997199..2854555..2963716..3237361..4063427..7777889

    md5 -s abbhdwsy1739529
    00000`8`bfb72caf77542c32b53a73439b
    00000`0`4ed0ede071d293b5f33de2dc2f
    00000`1`2be6057b2554c26bfddab18b08
    00000`b`f3f1ca8d1f229aa50b3093b2be
    00000`5`12874cc40b764728993dd71ffb
    00000`6`9710beec5f9a1943a610be52d8
    00000`a`8da36ee9b7e193f956cf701911
    00000`7`76b6ff41a7e30ed2d4b6663351

    leading to an answer of

    801b56a7

    an initial implementation in ruby took 10 seconds and thinking that "elixir
    is new and fast" I was surprised a base implementation took 3 times longer!
    I decided to investigate a bit more and take a look at:

      * speed of other implementations: perl, clojure, C?, java?
      * profiling of current implementations?
      * threading options: elixir processes, clojure?, bash fork?
        Ruby threading probably does not make sense here as this is a cpu bound
        operation.

## Performance overview

    language |  time
    ---------+------
    perl     |  3.9s
    ruby     | 11.8s
    elixir   | 32.0s
    clojure  | 92.0s (user 142s)
    bash     |
    C
    Java     |


## perl

		time ./md5_solver.pl
		801b56a7

		real  0m3.906s
		user  0m3.895s
		sys 0m0.008s

*TODO:* can I not wrap lines in `perl -e`???

    time perl -e 'use Digest::MD5 qw(md5_hex); @a; $count = 0; while($#a < 7){ $md5 = md5_hex("abbhdwsy${count}"); push @a, $md5 if $md5 =~ /^00000/; $count++; }; print join("", map { (split(//, $_))[5] } @a), "\n"'
    801b56a7

    real	0m3.884s
    user	0m3.877s
    sys	0m0.004s

## ruby

    time ./md5_solver.rb
    801b56a7

    real	0m11.755s
    user	0m11.695s
    sys	0m0.050s

    time ruby -e 'require "digest"; a = []; count = 0; while(a.size < 8) do; \
      md5 = Digest::MD5.hexdigest "abbhdwsy#{count}"; count += 1; \
      a << md5 if md5 =~ /^00000/ end; puts a.map{|v| v[5]}.join'

      801b56a7

    real	0m11.771s
    user	0m11.648s
    sys	0m0.065s

## Elixir

    time ./md5_solver.exs 
    801b56a7

    real	0m31.955s
    user	0m30.635s
    sys	0m1.403s

## Elixir GenServer

    defmodule Md5 do
      def md5(number) do
        :crypto.hash(:md5, "abbhdwsy#{number}") |> Base.encode16(case: :lower)
      end

      def do_md5 do
        # 1 Process per core
        # send message
        Stream.map((0..4_000_000), &(md5(&1)))
        |> Stream.filter(fn(md5) -> md5 =~ ~r/^00000/ end)
        |> Enum.take(3)
      end

      @cores 4

      def async_do_md5(take \\ 3) do
        Enum.map(0..@cores-1, fn number -> Calculator.start_link(self, number, @cores) end)

        Stream.repeatedly(fn ->
          receive do
            {number, md5} -> {number, md5}
          end
        end) |> Stream.filter(fn {_, md5} -> md5 =~ ~r/^00000/ end) |> Enum.take(take)
      end
    end

    defmodule Calculator do
      use GenServer

      def start_link(parent, number, step) do
        GenServer.start_link(__MODULE__, [parent, number, step])
      end

      def init([parent, number, step]) do
        send self, :md5
        {:ok, %{ parent: parent, number: number, step: step}}
      end

      def handle_info(:md5, %{ parent: parent, number: number, step: step} = state) do
        md5(parent, number, step)
        {:noreply, %{state | number: number + step }}
      end

      defp md5(parent, number, step) do
        send parent, {number, Md5.md5(number)}
        md5(parent, number + step, step)
      end
    end

## Clojure

    cd clojure-md5/
    time lein run
    801b56a7

    real	1m32.045s
    user	2m22.809s
    sys	0m1.157s

## Bash?

WIP

    count = 0; while true; do `md5 -s "abbhdwsy$count"`; $count=$count + 1; done

    md5 -s abbhdwsy1739529 | cut -d ' ' -f 4 | grep ^00000 | cut -c 6
    8

