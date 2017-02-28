defmodule ElixirMd5Test do
  use ExUnit.Case
  doctest ElixirMd5

  test "md5 number with key" do
    assert ElixirMd5.md5(1739529) == "000008bfb72caf77542c32b53a73439b"
  end

  # TODO slow - could fake out the Stream.iterate to only return
  # [1739529, 1910966, 1997199, 2854555, 2963716, 3237361, 4063427, 7777889]
  test "do_md5" do
    assert ElixirMd5.do_md5 == "801b56a7x"
  end
end
