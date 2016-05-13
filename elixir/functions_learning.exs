defmodule Functions do

   def fun do
      fn x -> x * 2 end
   end

   def fun2(x) do
      x * 2
   end

   def fun3(x, y) do
      x * y
   end

end


a_fun = &(&1 * 2)
a_fun2 = fn x -> x * 2 end


list = [1,2,3,4,5]


IO.inspect list |> Enum.map(Functions.fun) ## --> [2, 4, 6, 8, 10]
IO.inspect list |> Enum.map(&Functions.fun2/1) ## --> [2, 4, 6, 8, 10]
IO.inspect list |> Enum.map(&Functions.fun3(&1, 3)) ## --> [3, 6, 9, 12, 15]
IO.inspect list |> Enum.map(a_fun) ## --> [2, 4, 6, 8, 10]
IO.inspect list |> Enum.map(a_fun2) ## --> [2, 4, 6, 8, 10]
