defmodule Day3 do
  @alphabet %{
    a: 1,
    b: 2,
    c: 3,
    d: 4,
    e: 5,
    f: 6,
    g: 7,
    h: 8,
    i: 9,
    j: 10,
    k: 11,
    l: 12,
    m: 13,
    n: 14,
    o: 15,
    p: 16,
    q: 17,
    r: 18,
    s: 19,
    t: 20,
    u: 21,
    v: 22,
    w: 23,
    x: 24,
    y: 25,
    z: 26,
    A: 27,
    B: 28,
    C: 29,
    D: 30,
    E: 31,
    F: 32,
    G: 33,
    H: 34,
    I: 35,
    J: 36,
    K: 37,
    L: 38,
    M: 39,
    N: 40,
    O: 41,
    P: 42,
    Q: 43,
    R: 44,
    S: 45,
    T: 46,
    U: 47,
    V: 48,
    W: 49,
    X: 50,
    Y: 51,
    Z: 52
  }

  def part1 do
    parse("day3")
    |> Enum.map(&splitter/1)
    |> Enum.map(&intersector/1)
    |> evaluator(0)
  end

  defp evaluator([], acc), do: acc
  defp evaluator([[letter] | tail], acc) do
    atom = String.to_atom(letter)

    evaluator(tail, Map.get(@alphabet, atom) + acc)
  end


  defp intersector({firstCompartment, secondCompartment}) do
    fc = String.graphemes(firstCompartment) |> MapSet.new()
    sc = String.graphemes(secondCompartment) |> MapSet.new()

    MapSet.intersection(fc, sc) |> MapSet.to_list()
  end

  defp splitter(string) do
    half_length = trunc(String.length(string)/2)
    String.split_at(string, half_length)
  end

  def part2 do
    parse("day3")
    |> Enum.chunk_every(3)
    |> Enum.map(&trisector/1)
    |> evaluator(0)
  end

  defp trisector([a, b, c]) do
    a_letters = String.graphemes(a) |> MapSet.new()
    b_letters = String.graphemes(b) |> MapSet.new()
    c_letters = String.graphemes(c) |> MapSet.new()

    a_letters
    |> MapSet.intersection(MapSet.intersection(b_letters, c_letters))
    |> MapSet.to_list()
  end

  defp parse(input) do
    input
    |> Input.read()
    |> String.trim()
    |> String.split("\n")
  end
end
