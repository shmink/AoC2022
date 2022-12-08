defmodule D1 do
  @moduledoc false
  def part1(file) do
    file
    |> split_into_rows()
    |> split_into_arrays()
    |> lists_to_max()
    |> Enum.max()
  end

  def split_into_rows(file) do
    file
    |> File.stream!(trim: true, line_or_bytes: :line)
    |> Stream.map(&String.trim/1)
    |> Enum.take_every(1)
  end

  def split_into_arrays(calories) do
    calories
    |> Enum.chunk_by(fn x -> x == "" end)
    |> Enum.reject(&empty_list?/1)
  end

  def empty_list?([""]), do: true
  def empty_list?(_calories), do: false

  def lists_to_max(calories_list),
    do: Enum.map(calories_list, &total_calories/1)

  def total_calories(calories) do
    calculate_total = fn calory, total ->
      total + String.to_integer(calory)
    end

    Enum.reduce(calories, 0, calculate_total)
  end

  def part2(file) do
    file
    |> split_into_rows()
    |> split_into_arrays()
    |> lists_to_max()
    |> Enum.sort_by(& &1, :desc)
    |> Enum.take(3)
    |> Enum.sum()
  end
end
