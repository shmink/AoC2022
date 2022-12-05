defmodule Day4 do
  def part1 do
    parse("day4")
    |> Enum.map(&splitting/1)
    |> Enum.map(&pair_sets/1)
    |> Enum.reduce(0, fn [p1, p2], acc ->
      if MapSet.subset?(p1, p2) || MapSet.subset?(p2, p1) do
        acc + 1
      else
        acc
      end
    end)
  end

  def part2 do
    parse("day4")
    |> Enum.map(&splitting/1)
    |> Enum.map(&pair_sets/1)
    |> Enum.reduce(0, fn [p1, p2], acc ->
      case MapSet.intersection(p1, p2) |> MapSet.to_list do
        [] -> acc
        _ -> acc + 1
      end
    end)
  end

  defp pair_sets([pair1, pair2]) do
    p1 = Enum.map(pair1, &String.to_integer/1)
    p2 = Enum.map(pair2, &String.to_integer/1)

    [
      List.first(p1)..List.last(p1) |> MapSet.new(),
      List.first(p2)..List.last(p2) |> MapSet.new()
    ]
  end

  defp splitting(pairs) do
    pairs
    |> String.split(",")
    |> Enum.map(&(String.split(&1, "-")))
  end

  defp parse(input) do
    input
    |> Input.read()
    |> String.trim()
    |> String.split("\n")
  end
end
