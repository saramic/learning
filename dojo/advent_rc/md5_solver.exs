#!/usr/bin/env elixir

advent_crypto = fn (number) ->
  :crypto.hash(:md5, "abbhdwsy#{number}") |> Base.encode16(case: :lower)
end

IO.puts Enum.join Stream.iterate(0, &(&1+1))
  |> Stream.map(fn(a) -> advent_crypto.(a) end)
  |> Stream.filter(fn(a) -> Regex.run(~r{^00000}, a) != nil end)
  |> Enum.take(8)
  |> Enum.map(fn(a) -> Enum.slice(to_charlist(a), 5, 1) end)

