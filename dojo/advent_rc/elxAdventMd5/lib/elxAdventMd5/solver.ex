defmodule ElxAdventMd5.Solver do
  def run(key, number) do
    advent_crypto(key, number)
  end

  def advent_crypto(key, number) do
    :crypto.hash(:md5, "#{key}#{number}")
      |> Base.encode16(case: :lower)
  end
end
