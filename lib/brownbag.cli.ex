defmodule Brownbag.CLI do
  # use Application here is like 'implement this inteface' - called a protocol in Elixir/Erlang
  use Application

  def start(_type, _args) do
    IO.puts("Jello")

    Supervisor.start_link([], strategy: :one_for_one)
  end
end
