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

  defp get_count(working_list, complete_list \\ false, map \\ %{})

  defp get_count(list=[word|tail], complete_list, map) do
    complete_list = complete_list || list

    count = Enum.count(complete_list, &(&1 == word))
    map = Dict.put(map, word, count)

    get_count(tail, complete_list, map)
  end

  defp get_count([], _, map) do
    map
  end

  defp sanitize(string) do
    String.replace(string, ~r/[!&@$%^&]/, "")
  end

end
