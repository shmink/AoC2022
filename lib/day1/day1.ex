defmodule Day1 do
  def total_calories do
    "day1"
    |> Input.read()
    |> String.split("\n")
    |> Enum.chunk_by(&(&1 == ""))
    |> Enum.reject(&(&1 == [""]))
    |> Enum.map(&converter/1)
    |> Enum.map(&adder/1)
  end

  def part1 do
    total_calories()
    |> Enum.max()
  end

  def part2 do
    total_calories()
    |> Enum.sort()
    |> Enum.take(-3)
    |> Enum.sum
  end

  # just wanted to experiment with making a recursive map for fun
  # def mapper([], elves, _elf) when is_map(elves), do: elves
  # def mapper([head | tail], elves \\ %{}, elf \\ 1) do
  #   newMap = Map.put(elves, String.to_atom("elf#{elf}"), head)
  #   mapper(tail, newMap, elf+1)
  # end

  defp converter(calories) when is_list(calories) do
    calories
    |> Enum.map(&String.to_integer/1)
  end

  defp adder([head | tail]) do
    head + adder(tail)
  end

  defp adder([]), do: 0

  defp adder(nil), do: 0

end
