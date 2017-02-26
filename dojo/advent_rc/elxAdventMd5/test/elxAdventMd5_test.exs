defmodule ElxAdventMd5Test do
  use ExUnit.Case
  doctest ElxAdventMd5

  import ElxAdventMd5.Solver, only: [ advent_crypto: 2 ]

  test "md5 advent solve" do
    assert advent_crypto("abc", 1) == "23734cd52ad4a4fb877d8a1e26e5df5f"
  end
end
