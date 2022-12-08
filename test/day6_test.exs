defmodule Day6Test do
  use ExUnit.Case

  test "example 1" do
    assert Day6.find_first_unique("mjqjpqmgbljsphdztnvjfqwrcgsmlb", 4) == 7
  end

  test "example 2" do
    assert Day6.find_first_unique("bvwbjplbgvbhsrlpgdmjqwftvncz", 4) == 5
  end

  test "example 3" do
    assert Day6.find_first_unique("nppdvjthqldpwncqszvftbrmjlhg", 4) == 6
  end

  test "example 4" do
    assert Day6.find_first_unique("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", 4) == 10
  end

  test "example 5" do
    assert Day6.find_first_unique("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", 4) == 11
  end

  test "example 6" do
    assert Day6.find_first_unique("mjqjpqmgbljsphdztnvjfqwrcgsmlb", 14) == 19
  end

  test "example 7" do
    assert Day6.find_first_unique("bvwbjplbgvbhsrlpgdmjqwftvncz", 14) == 23
  end

  test "example 8" do
    assert Day6.find_first_unique("nppdvjthqldpwncqszvftbrmjlhg", 14) == 23
  end

  test "example 9" do
    assert Day6.find_first_unique("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", 14) == 29
  end

  test "example 10" do
    assert Day6.find_first_unique("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", 14) == 26
  end
end
