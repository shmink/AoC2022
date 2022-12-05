defmodule Input do
  def read(day_number) do
    "lib/" <> day_number <> "/input.txt"
    |> File.read!()
  end
end
