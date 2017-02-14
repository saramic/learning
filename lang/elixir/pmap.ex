defmodule C do
  def map([], _func), do: []
  def map([head | tail], func), do: [ func.(head) | map(tail, func)]
end

IO.inspect C.map [1,2,3,4,5], fn x -> x*x end
IO.inspect C.map [1,2,3,4,5], &(&1*&1) # shortcut to create function multiplying first arg by first arg

