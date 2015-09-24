defmodule Shortname do

	def _short_name([head | [] ], acc), do: Enum.reverse([head|acc]) |> Enum.join(" ")

	def _short_name([head | tail], acc), do: _short_name(tail,[String.first(head) <>"." | acc])

	def _short_name([head | tail]), do: _short_name(tail, [head])

	def short_name(name) do
		name = String.split(name, " ")

		case name do
			[_head |[]]  -> name
			[_head | _tail] -> _short_name(name)
		end
	end


end

IO.inspect Shortname.short_name("George Michael Harrison Bleuth")
