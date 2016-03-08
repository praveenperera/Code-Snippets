defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l), do: _count(l, 0)

  @spec reverse(list) :: list
  def reverse(l), do:  _reverse(l, [])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do:  _map(l,f)

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do:  _filter(l, f)

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f), do:  _reduce(l,acc,f)

  @spec append(list, list) :: list
  def append(a, b), do:  _append(a,b)

  @spec concat([[any]]) :: [any]
  def concat(ll), do: ll |> filter(fn x -> x != [] end) |> _concat()

  defp _count([], acc), do: acc
  defp _count([_|tail], acc), do: _count(tail, acc + 1)


  defp _reverse([hd |tail], reversed_list), do: _reverse(tail, [hd | reversed_list])
  defp _reverse([], reversed_list), do: reversed_list

  defp _map(incoming_list, f, reversed_list \\ [])
  defp _map([], _, reversed_list), do:  reversed_list |> reverse
  defp _map([hd |tail], f, reversed_list), do:  _map(tail, f, [f.(hd)| reversed_list])

  defp _filter(incoming_list, f, reversed_list \\ [])
  defp _filter([], _, reversed_list), do: reversed_list |> reverse

  defp _filter([hd |tail], f, reversed_list) do
    case f.(hd) do
      true -> _filter(tail, f, [hd | reversed_list])
      _ -> _filter(tail, f, reversed_list)
    end
  end

  defp _reduce([], acc, _ ), do: acc
  defp _reduce([hd |tail], acc, f), do: _reduce(tail, f.(hd, 0) + acc, f)

  defp _append(_, _, reversed_list \\  [] )
  defp _append([], [], reversed_list), do:  reversed_list |> reverse
  defp _append([hd | tail], l2, reversed_list), do: _append(tail, l2, [hd | reversed_list])
  defp _append(l1 = [], [hd | tail], reversed_list), do: _append(l1, tail, [hd | reversed_list])

  defp _concat(l1, acc \\ [])
  defp _concat([], acc), do:  acc |> reverse
  defp _concat([ [] | [tail_hd | tail_tail ] ], acc), do: _concat(tail_tail, [tail_hd | acc])
  defp _concat([ [hd_head | []]| tail], acc), do: _concat(tail, [hd_head | acc])
  defp _concat([ [hd_head | hd_tail] | tail], acc), do: _concat([hd_tail | tail], [hd_head | acc])

end
