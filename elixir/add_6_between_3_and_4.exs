defmodule CustomList do
   def list_inter(_list, acc \\ [])

   def list_inter([], acc) do
      Enum.reverse(acc)
   end

   def list_inter([3,4 | tail], acc) do
      acc =  [4,6,3 | acc]
      list_inter(tail, acc)
   end

   def list_inter([hd | tail], acc) do
      acc = [hd|acc]
      list_inter(tail, acc)
   end
end

IO.inspect CustomList.list_inter([2,3,4,5,3,4])
