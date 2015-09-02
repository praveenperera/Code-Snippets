defmodule Slowfib do
  def fib(0) do 0 end
  def fib(1) do 1 end
  def fib(n) do fib(n-1) + fib(n-2) end
end

defmodule Tailfib do
  def fib(a\\0, b\\1, n ) #set up

  def fib(a, _, 0 ), do: a #final
  def fib(a, b, n), do: fib(b, a+b, n-1)
end

defmodule CachedFib do
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(2), do: 1 #just caching one more

  def fib(n) do
    fib(n, 1, 1)
  end

  defp fib(3, previous, current) do
    current + previous
  end

  defp fib(n, previous, current) do
    fib(n - 1, current, previous + current)
  end

  def fib2 do
    Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
  end

end

n = 10
# IO.puts Slowfib.fib(n)
IO.puts Tailfib.fib(n)
IO.puts CachedFib.fib(n)

# IO.puts CachedFib.fib2 |> Enum.take(n-1) |> Enum.reduce(1,fn (x, memo) -> memo + x end)




