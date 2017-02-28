# from Brazil/NZ dude from camp
defmodule Md5 do
  def md5(number) do
    :crypto.hash(:md5, "abbhdwsy#{number}") |> Base.encode16(case: :lower)
  end

  def do_md5 do
    # 1 Process per core
    # send message
    Stream.map((0..4_000_000), &(md5(&1)))
    |> Stream.filter(fn(md5) -> md5 =~ ~r/^00000/ end)
    |> Enum.take(3)
  end

  @cores 4

  def async_do_md5(take \\ 3) do
    Enum.map(0..@cores-1, fn number -> Calculator.start_link(self, number, @cores) end)

    Stream.repeatedly(fn ->
      receive do
        {number, md5} -> {number, md5}
      end
    end) |> Stream.filter(fn {_, md5} -> md5 =~ ~r/^00000/ end) |> Enum.take(take)
  end
end

defmodule Calculator do
  use GenServer

  def start_link(parent, number, step) do
    GenServer.start_link(__MODULE__, [parent, number, step])
  end

  def init([parent, number, step]) do
    send self, :md5
    {:ok, %{ parent: parent, number: number, step: step}}
  end

  def handle_info(:md5, %{ parent: parent, number: number, step: step} = state) do
    md5(parent, number, step)
    {:noreply, %{state | number: number + step }}
  end

  defp md5(parent, number, step) do
    send parent, {number, Md5.md5(number)}
    md5(parent, number + step, step)
  end
end
