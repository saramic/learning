defmodule TailRecursion do
  def sum(n) do
    if n == 0 do
      0
    else
      n + sum(n - 1)
    end
  end

  def sum_tail_recursive(n, acc) do
    if n == 0 do
      acc
    else
      sum_tail_recursive(n - 1, acc + n)
    end
  end
end

# todo why does this not fail?
IO.puts TailRecursion.sum(1_000_000)
IO.puts TailRecursion.sum_tail_recursive(1_000_000, 0)
