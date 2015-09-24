defmodule Math do
   def double(x), do: x * 2
   def triple(x), do: x * 3
   def quaduple(x), do: double(x) * 2

   def fact(0), do: 1
   def fact(n) when n < 0, do: fact(abs(n))
   def fact(n), do: n * fact(n-1)

   def gcd(x,0), do: x
   def gcd(x,y), do: gcd(y, rem(x,y))

   def timer(x), do: :timer.tc(fn -> x end, [])
   def time, do: fn x -> :timer.tc(fn -> x end, []) |> elem(0) |> IO.puts end
   def time_in_seconds, do: fn x -> :timer.tc(fn -> x end, []) |> elem(0) |> Kernel./(1_000_000) end

end
