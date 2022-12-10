defmodule Day7 do
  def part1() do
    parse("day7")
    |> file_explorer([], [])
    |> directory_size()
    |> child_dirs()
    |> size_filter(100_000)
    |> Enum.reduce(0, fn x, acc -> x.size + acc end)
  end

  def size_filter(dirs, size), do: Enum.filter(dirs, fn x -> x.size <= size end)

  def child_dirs(dirs) do
    for %{path: path} <- dirs do
      size =
        dirs
        |> Enum.filter(&Enum.slice(&1.path, 0..length(path)-1) == path)
        |> Enum.map(& &1.size)
        |> Enum.sum()
      %{path: path, size: size}
    end
  end

  def directory_size(files) do
    files
    |> Enum.group_by(&(&1.path))
    |> Enum.sort_by(fn {path, _files} -> length(path) end, :desc)
    |> Enum.map(fn {path, files} ->
      %{
        path: path,
        size: Enum.reduce(files, 0, fn y, acc -> y.size + acc end)
      }
      end)
  end

  def file_explorer([], _acc, tree), do: tree
  def file_explorer([head | tail], acc, tree) do
    case head do
      ["cd .."] ->
        file_explorer(tail, List.delete_at(acc, -1), tree)

      ["cd " <> folder_name] ->
        file_explorer(tail, acc ++ [folder_name], tree)

      ["ls" | files] ->
        file_explorer(tail, acc, tree ++ Enum.map(files, fn x -> file_sorter(x, acc) end))

      _ -> file_explorer(tail, acc, tree)
      end
  end

  def file_sorter(s, acc) when is_bitstring(s) do
    [size, name] = String.split(s, " ", trim: true)
    %{file: name, size: String.to_integer(size), path: acc}
  end

  defp parse(input) do
    input
    |> Input.read()
    |> String.trim()
    |> String.split("$ ", trim: true)
    |> Enum.map(&(String.split(&1, "\n", trim: true)))
    |> Enum.map(fn x ->
        Enum.reject(x, fn y ->
          String.slice(y, 0, 3) == "dir"
        end)
      end)
  end
end

# defmodule BinaryTree do
# 	defstruct path: nil, size: nil, left: nil, right: nil
#   def new(%{path: path, size: size}) do
#     str
#   end
# end
