defmodule ElxAdventMd5.Solver do
  def md5(key, number) do
    :crypto.hash(:md5, "#{key}#{number}")
      |> Base.encode16(case: :lower)
  end

  def do_md5(key, limit) do
    Stream.iterate(0, &(&1+1))
    |> Stream.map(&(md5(key, &1)))
    |> Stream.filter(&(&1 =~ ~r/^00000/))
    |> Enum.take(limit)
    |> Enum.map(&(&1))
  end
end
