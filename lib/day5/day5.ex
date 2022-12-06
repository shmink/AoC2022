defmodule Day5 do
  def part1 do
    [commands, stacks] = parse("day5")

    executer(commands, stacks)
    |> Enum.map(&List.first/1)
    |> Enum.join
  end

  def part2 do
    [commands, stacks] = parse("day5")

    executer2(commands, stacks)
    |> Enum.map(&List.first/1)
    |> Enum.join
  end


  defp executer([], stacks), do: stacks
  defp executer([command | rest], stacks) do
    # This function does what it needs to do but I'm not proud of it.
    origin_stack = Enum.at(stacks, command.origin-1)
    destination_stack = Enum.at(stacks, command.destination-1)

    crates = Enum.take(origin_stack, command.amount) |> Enum.reverse()
    # reverse needed because I believe the problem is flawed.
    # Picking up crates wouldn't reverse the order in the real world but it does in this puzzle.
    # EDIT: Turns out I was unknowingly solving part 2. Thankfully a simple change.
    movement = List.replace_at(stacks, command.destination-1, crates ++ destination_stack)

    origin_crate_amount = length(origin_stack) - command.amount
    less_crates = Enum.take(origin_stack, -origin_crate_amount)
    final = List.replace_at(movement, command.origin-1, less_crates)

    executer(rest, final)
  end

  defp executer2([], stacks), do: stacks
  defp executer2([command | rest], stacks) do
    IO.inspect(stacks)
    IO.inspect(command)

    origin_stack = Enum.at(stacks, command.origin-1)
    destination_stack = Enum.at(stacks, command.destination-1)

    crates = Enum.take(origin_stack, command.amount)
    movement = List.replace_at(stacks, command.destination-1, crates ++ destination_stack)

    origin_crate_amount = length(origin_stack) - command.amount
    less_crates = Enum.take(origin_stack, -origin_crate_amount)
    final = List.replace_at(movement, command.origin-1, less_crates)

    executer2(rest, final)
  end

  defp transpose(matrix) do
    matrix
    |> Enum.at(0)
    |> Enum.with_index()
    |> Enum.map(fn {_, idx} ->
      Enum.map(matrix, fn row ->
        Enum.at(row, idx)
      end)
    end)
  end

  defp move_parser(command) do
    [amount, origin, destination] =
      command
      |> String.split(~r/[^\d]/)
      |> Enum.reject(fn x -> x == "" end)
      |> Enum.map(&String.to_integer/1)

    %{amount: amount, origin: origin, destination: destination}
  end

  defp parse(input) do
    [all_stacks, all_commands] =
      input
      |> Input.read()
      |> String.split("\n\n")

      stacks =
        all_stacks
        |> String.split("\n")
        |> Enum.map(&String.split(&1, ""))
        |> transpose()
        |> Enum.map(fn x ->
          Enum.filter(x, fn y ->
            String.match?(y, ~r/[A-Z]/)
          end)
        end)
        |> Enum.reject(fn x -> length(x) == 0 end)

      commands =
        all_commands
        |> String.split("\n")
        |> Enum.map(&move_parser/1)

      [commands, stacks]
  end
end
