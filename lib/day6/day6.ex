defmodule Day6 do
  def part1 do
    parse("day6")
    |> find_first_unique(4)
  end

  def part2 do
    parse("day6")
    |> find_first_unique(14)
  end

  def find_first_unique(string, size, start \\ 0) do
    count =
      string
      |> String.slice(start, size)
      |> String.split("", trim: true)
      |> Enum.uniq()
      |> length()

    cond do
      count == size -> start + size
      true -> find_first_unique(string, size, start + 1)
    end
  end

  defp parse(filename) do
    filename
    |> Input.read()
    |> String.trim()
  end
end
