defmodule Parallel do
  def pmap(collection, fun) do
    me = self
    collection |> Enum.map(fn (elem) -> spawn_link fn -> (send me, {self, fun.(elem) }) end end) |> Enum.map(fn (pid) ->  receive do {^pid, result } -> result end end)
  end

  def pmap2(collection, func) do
  collection
  |> Enum.map(&(Task.async(fn -> func.(&1) end)))
  |> Enum.map(&Task.await/1)
  end
end
