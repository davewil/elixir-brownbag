defmodule Structs.Example do
  defstruct name: "Olga", roles: [:manager]

  def do_something(user) do
    IO.puts (user.name)
  end
end

defmodule Structs.Demos do
  def demo() do
    IO.inspect(%Structs.Example{}, label: "default values")
    IO.inspect(%Structs.Example{name: "Olga", roles: [:queen_bee]}, label: "new values")
    olga = %Structs.Example{name: :Olga}
    olga = %{olga | name: :David}
    IO.inspect(olga, label: "part new, part old")

    user = %{name: "David"}

    Structs.Example.do_something(user)
  end
end
