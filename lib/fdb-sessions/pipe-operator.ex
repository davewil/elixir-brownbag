defmodule PipeOperator do
  # https://elixirschool.com/en/lessons/basics/pipe_operator#examples-1
  def func1(argument) do
    argument
  end

  def func2(argument) do
    argument
  end

  def demo_pipe_operator() do
    # without pipe operator
    func1(func2("hello"))

    # with pipe operator
    func2("hello2") |> func1()
  end

  @spec output_list(maybe_improper_list()) :: :ok
  def output_list(input) when is_list(input) do
    input |> Enum.map(&String.upcase/1) |> IO.puts()
  end

  def demo_examples() do
    "Elixir, rocks" |> String.split(",") |> output_list()
  end
end
