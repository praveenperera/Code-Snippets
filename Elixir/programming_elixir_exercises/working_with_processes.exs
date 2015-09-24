defmodule MyProcess do

   def two_processes do
      me = self
      spawn(fn -> (send me, "fred") end)
      spawn(fn -> (send me, "betty") end)

      receive do
         person -> "Token is #{person}"
      end
   end

   def run do
      IO.inspect two_processes
      IO.inspect two_processes
   end

end
