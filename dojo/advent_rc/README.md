# Advent MD5

## perl

    time perl -e 'use Digest::MD5 qw(md5_hex); use Data::Dumper; @a; \
      $count = 0; while($#a < 7){ $md5 = md5_hex("abbhdwsy${count}"); \
      push @a, $md5 if $md5 =~ /^00000/; $count++; }; print Dumper @a'

    $VAR1 = '000008bfb72caf77542c32b53a73439b';
    $VAR2 = '0000004ed0ede071d293b5f33de2dc2f';
    $VAR3 = '0000012be6057b2554c26bfddab18b08';
    $VAR4 = '00000bf3f1ca8d1f229aa50b3093b2be';
    $VAR5 = '00000512874cc40b764728993dd71ffb';
    $VAR6 = '0000069710beec5f9a1943a610be52d8';
    $VAR7 = '00000a8da36ee9b7e193f956cf701911';
    $VAR8 = '00000776b6ff41a7e30ed2d4b6663351';

    real	0m3.990s
    user	0m3.897s
    sys	0m0.075s

## ruby

    time ruby -e 'require "digest"; a = []; count = 0; while(a.size < 8) do; \
      md5 = Digest::MD5.hexdigest "abbhdwsy#{count}"; count += 1; \
      a << md5 if md5 =~ /^00000/ end; puts a.map{|v| v[5]}.join'

      801b56a7

    real	0m11.771s
    user	0m11.648s
    sys	0m0.065s

## Elixir

    time elixir md5_solver.exs
    8
    0
    1
    b
    5
    6
    a
    7

    real	0m30.174s
    user	0m29.947s
    sys	0m0.325s

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
