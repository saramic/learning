defmodule Parallel do
  def extract_5th(a) do
    if Regex.run(~r{^00000}, a) != nil do
      Enum.slice(to_charlist(a), 5, 1)
    else
      nil
    end
  end

  def md5(number) do
    :crypto.hash(:md5, "abbhdwsy#{number}")
      |> Base.encode16(case: :lower)
      |> extract_5th
  end

  def pmap(collection, fun) do
    me = self()
    collection
    |> Enum.map(fn (elem) ->
        spawn_link fn -> (send me, { self(), fun.(elem) }) end
      end)
    |> Enum.map(fn (pid) ->
        receive do { ^pid, result } -> result end
      end)
  end
end
