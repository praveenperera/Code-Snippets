defmodule NamedParam do

  def keyword_list_params(name: name, birthday: bday) do
      IO.puts("-------------------")
      IO.puts name
      IO.puts bday
  end

  def named_params(options) do
    %{name: name, birthday: bday} = Enum.into(options, %{})
    IO.puts("-------------------")
    IO.puts name
    IO.puts bday
  end

  def named_params_with_defaults(options) do
    defaults = [name: "Praveen", birthday: "1992-03-22"]
    %{name: name, birthday: bday} = defaults |> Keyword.merge(options) |> Enum.into(%{})
    IO.puts("-------------------")
    IO.puts name
    IO.puts bday
  end

end

NamedParam.keyword_list_params(name: "Praveen", birthday: "1992-03-22") #works

NamedParam.named_params(name: "Praveen", birthday: "1992-03-22") #works
NamedParam.named_params(birthday: "1992-03-22", name: "Praveen") #works
NamedParam.named_params(name: "Praveen", birthday: "1992-03-22", extra: "nonsense") #works

NamedParam.named_params_with_defaults(name: "George") #works
NamedParam.named_params_with_defaults(birthday: "1992-03-30") #works
NamedParam.named_params_with_defaults(name: "Praveen", birthday: "1992-03-22", extra: "nonsense") #works

# NamedParam.keyword_list_params(name: "Praveen", birthday: "1992-03-22", extra: "nonsense") #fails
# NamedParam.keyword_list_params(birthday: "1992-03-22", name: "Praveen") #fails

