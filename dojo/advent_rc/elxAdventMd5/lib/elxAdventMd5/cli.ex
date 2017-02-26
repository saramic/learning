defmodule ElxAdventMd5.CLI do

  @moduledoc """
  Handle command line parsing to limit the running of the advent Md5 solver
  """

  def run(argv) do
    parse_args(argv)
  end

  @doc """
  `argv` can be -h or --help

  otherwise the key and number of letters to fetch
  ./ElxAdventMd5 abbhdwsy 8
  would fetch the first 8 md5 hashes of abbhdwsy[num] where num is 0 to
  infinity
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean],
                                     aliases:  [ h:    :help   ])
    case parse do
      { [ help: true ], _, _, }
        -> :help
      { _, [ key, number ], _ }
        -> { key, String.to_integer(number) }
      _ -> :help
    end
  end
end
