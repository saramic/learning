defmodule CliTest do
  use ExUnit.Case
  doctest ElxAdventMd5

  import ElxAdventMd5.CLI, only: [ parse_args: 1 ]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h",     "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "two values returned if two given" do
    assert parse_args(["abc", "123"]) == { "abc", 123 }
  end
end
