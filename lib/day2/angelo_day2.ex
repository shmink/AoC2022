defmodule D2 do
  @moduledoc false

  @rock 1
  @paper 2
  @scissors 3

  @lost 0
  @draw 3
  @win 6

  @rankings %{
    "A X" => @rock + @draw,
    "A Y" => @paper + @win,
    "A Z" => @scissors + @lost,
    "B X" => @rock + @lost,
    "B Y" => @paper + @draw,
    "B Z" => @scissors + @win,
    "C X" => @rock + @win,
    "C Y" => @paper + @lost,
    "C Z" => @scissors + @draw
  }

  Enum.each(@rankings, fn {move, points} ->
    def match_move(unquote(move)), do: unquote(points)
  end)

  defp parse(input) do
    input
    |> Input.read()
    |> String.trim()
    |> String.split("\n")
  end

  def part1() do
    parse("day2")
    |> Enum.reduce(0, fn lol_tom, acc ->
      acc + match_move(lol_tom)
    end)
  end
end
