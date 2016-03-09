defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
     |> sanitize
     |> strip_punctuation
     |> remove_extra_spaces
     |> split_on_spaces
     |> select_capitals
     |> String.upcase
  end

  def sanitize(string), do: string |> String.strip |> strip_punctuation

  def strip_punctuation(string), do: String.replace(string, ~r{[^a-zA-Z ]+}, "")

  def remove_extra_spaces(string), do: String.replace(string, ~r{\s\s+}, " ")

  def split_on_spaces(string), do: String.split(string, " ")

  def select_capitals(list) do
     list |> Enum.reduce("", fn x, acc ->
       mid_word_capitals = Regex.scan(~r/[A-Z]/, x) |> List.flatten |> get_midword_capitals
       acc <> String.first(x) <> mid_word_capitals
     end)
  end

  def get_midword_capitals(list) do
    if length(list) > 0, do: tl(list) |> Enum.join(""), else: Enum.join(list, "")
  end
end
