defmodule Structs.Example do
  defstruct name: "Olga", roles: [:manager]
end

defmodule Structs.Demos do
  def demo() do
    IO.inspect(%Structs.Example{}, label: "default values")
    IO.inspect(%Structs.Example{name: "Olga", roles: [:queen_bee]}, label: "new values")
    olga = %Structs.Example{name: :Olga}
    olga = %{olga | name: :David}
    IO.inspect(olga, label: "part new, part old")
  end
end
