defmodule Structs.Example do
  defstruct name: "Olga", roles: []

end

defmodule Structs.Demos do

  def demo() do
    IO.inspect %Structs.Example{} #default values
    IO.inspect %Structs.Example{name: "Olga", roles: [:queen_bee]} #new values
    olga= %Structs.Example{name: :Olga} #part new, part default
    olga= %{olga | name: :David} #update values
    IO.inspect olga
  end

end
