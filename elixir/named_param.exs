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
    defaults = [name: "Sarah", birthday: "1985-12-15"]
    %{name: name, birthday: bday} = defaults |> Keyword.merge(options) |> Enum.into(%{})
    IO.puts("-------------------")
    IO.puts name
    IO.puts bday
  end

  def named_params_with_defaults_kw_list(options) do
    defaults = [name: "Sarah", birthday: "1985-12-15"]
    [name: name, birthday: bday] =  Keyword.merge(defaults, options)
    IO.puts("-------------------")
    IO.puts name
    IO.puts bday
  end

end

NamedParam.keyword_list_params(name: "Sarah", birthday: "1985-12-15") #works

NamedParam.named_params(name: "Sarah", birthday: "1985-12-15") #works
NamedParam.named_params(birthday: "1985-12-15", name: "Sarah") #works
NamedParam.named_params(name: "Sarah", birthday: "1985-12-15", extra: "nonsense") #works

NamedParam.named_params_with_defaults(name: "George") #works
NamedParam.named_params_with_defaults(birthday: "1992-03-30") #works
NamedParam.named_params_with_defaults(name: "Sarah", birthday: "1985-12-15", extra: "nonsense") #works
NamedParam.named_params_with_defaults(extra: "nonsense", name: "Sarah",  birthday: "1985-12-15",) #works


# NamedParam.named_params_with_defaults_kw_list(name: "George") #fails
# NamedParam.named_params_with_defaults_kw_list(birthday: "1992-03-30") #fails
# NamedParam.named_params_with_defaults_kw_list(name: "Sarah", birthday: "1985-12-15", extra: "nonsense") #fails

# NamedParam.keyword_list_params(name: "Sarah", birthday: "1985-12-15", extra: "nonsense") #fails
# NamedParam.keyword_list_params(birthday: "1992-03-22", name: "Sarah") #fails

