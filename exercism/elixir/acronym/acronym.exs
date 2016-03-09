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
     |> split_camelcase_words
     |> split_on_spaces
     |> select_first_letter
     |> String.upcase
  end

  def sanitize(string), do: string |> String.strip |> strip_punctuation

  def strip_punctuation(string), do: String.replace(string, ~r{[^a-zA-Z ]+}, "")

  def remove_extra_spaces(string), do: String.replace(string, ~r{\s\s+}, " ")

  def split_on_spaces(string), do: String.split(string, " ")

  def split_camelcase_words(string), do: Regex.replace(~r/([[:lower:]])([[:upper:]])/, string, "\\1 \\2")

  def select_first_letter(list), do: Enum.reduce(list, "", fn x, acc -> acc <> String.first(x) end)
end
