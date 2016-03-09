defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.split("")
    |> Enum.reject(&(&1 == ""))
    |> _encode

  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    string
    |> String.split("")
    |> Enum.reject(&(&1 == ""))
    |> convert_to_ints
    |> combine_digits
    |> expand
  end

  defp _encode(list, acc \\ [])
  defp _encode([], acc), do: Enum.reverse(acc) |> Enum.join()
  defp _encode([ num, a, a | tail ], acc) when is_integer(num), do: _encode( [num+1, a | tail], acc)
  defp _encode([ num, a, b | tail ], acc) when is_integer(num), do: _encode( [1, b | tail], [a, num |acc] )
  defp _encode([ a,a | tail ], acc), do: _encode( [2, a | tail], acc)
  defp _encode([ a,b | tail ], acc) when is_integer(a) == false, do: _encode( [1, a, b | tail],  acc)
  defp _encode([ hd | tail ], acc), do: _encode( tail, [ hd | acc])

  defp convert_to_ints(list), do: Enum.map(list, fn x -> if Regex.match?(~r{\d}, x), do: String.to_integer(x), else: x end)

  defp combine_digits(list, acc \\ [])
  defp combine_digits([], acc), do: Enum.reverse(acc)
  defp combine_digits([a,b | tail], acc) when is_integer(a) and is_integer(b) do
    c = Integer.to_string(a) <> Integer.to_string(b) |> String.to_integer
    combine_digits([c | tail], acc)
  end
  defp combine_digits([hd | tail], acc), do: combine_digits(tail, [hd | acc])

  defp expand(list, acc \\ [])
  defp expand([], acc), do: Enum.reverse(acc) |> Enum.join
  defp expand([num, a | tail], acc) when is_integer(num), do: expand(tail, [ String.duplicate(a, num) | acc] )


end
