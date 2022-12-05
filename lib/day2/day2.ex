defmodule Day2 do
  def part1 do
    parse("day2")
    |> Enum.reduce(0, fn x, acc -> result(x) + acc end)
  end

  # A = elf Rock      1
  # B = elf paper     2
  # C = elf scissors  3

  # X = my rock
  # Y = my paper
  # Z = my scissors

  defp result("A X"), do: 1 + 3
  defp result("A Y"), do: 2 + 6
  defp result("A Z"), do: 3 + 0
  defp result("B X"), do: 1 + 0
  defp result("B Y"), do: 2 + 3
  defp result("B Z"), do: 3 + 6
  defp result("C X"), do: 1 + 6
  defp result("C Y"), do: 2 + 0
  defp result("C Z"), do: 3 + 3

  def part2 do
    parse("day2")
    |> Enum.reduce(0, fn x, acc -> conclusion(x) + acc end)
  end

  # X = need to lose
  # Y = need to draw
  # Z = need to win

  def conclusion("A X"), do: 3 + 0
  def conclusion("A Y"), do: 1 + 3
  def conclusion("A Z"), do: 2 + 6
  def conclusion("B X"), do: 1 + 0
  def conclusion("B Y"), do: 2 + 3
  def conclusion("B Z"), do: 3 + 6
  def conclusion("C X"), do: 2 + 0
  def conclusion("C Y"), do: 3 + 3
  def conclusion("C Z"), do: 1 + 6

  defp parse(input) do
    input
    |> Input.read()
    |> String.trim()
    |> String.split("\n")
  end
end
