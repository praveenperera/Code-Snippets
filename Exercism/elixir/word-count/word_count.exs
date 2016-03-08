defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
      |> String.downcase
      |> sanitize()
      |> String.split([" ", "_", ":", ","], trim: true)
      |> get_count()
  end

  defp get_count(list, map \\ %{})

  defp get_count([word|tail], map) do
    map = Dict.update(map, word, 1, &(&1 + 1))
    get_count(tail, map)
  end

  defp get_count([], map) do
    map
  end

  defp sanitize(string) do
    String.replace(string, ~r/[!&@$%^&]/, "")
  end

end
