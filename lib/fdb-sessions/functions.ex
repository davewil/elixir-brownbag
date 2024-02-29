defmodule Functions do
  # recursive function calls - https://elixirschool.com/en/lessons/basics/functions#named-functions-2
  @spec of([number()]) :: number()
  def of([]), do: 0
  def of([head | tail]), do: head * 1 + of(tail)

  def demo_recursive_call() do
    IO.puts(of([]))
    IO.puts(of([1, 2, 3, 4, 5]))
  end

  # function pattern matching pt.1 controlling flow by match - https://elixirschool.com/en/lessons/basics/functions#pattern-matching-1
  def demo_pattern_matching_1() do
    handle_result = fn
      {:ok, result} -> IO.puts(result)
      {:error} -> IO.puts("Error")
      _ -> IO.puts("Any other case")
    end

    handle_result.({:ok, "result"})
    handle_result.({:ok, 123})
    handle_result.({:error})
    handle_result.({})
  end

  # overload by arity - https://elixirschool.com/en/lessons/basics/functions#function-naming-and-arity-3
  def hello(), do: "Hello no args"
  def hello(name), do: "Hello, " <> name
  def hello(name1, name2), do: "Hello, #{name1} and #{name2}"

  def demo_overload_by_arity() do
    IO.puts(hello())
    IO.puts(hello("Olga"))
    IO.puts(hello(:Olga, :Eldon))
  end

  # function pattern matching pt.1 capturing match value - https://elixirschool.com/en/lessons/basics/functions#functions-and-pattern-matching-4
  def hello2(%{name: person_name} = person) do
    case person do
      %{name: _, last_name: last} -> IO.puts("#{last}, #{person_name}")
      %{name: _} -> IO.puts(person_name)
    end
  end

  def demo_pattern_matching_2() do
    hello2(%{name: "Dave"})
    hello2(%{name: "Dave", last_name: "Wilks"})
  end

  # guards - https://elixirschool.com/en/lessons/basics/functions#guards-6
  def elixir_of_life(age) when is_binary(age) do
    IO.puts("I can't make strings younger. You are #{age}")
  end

  def elixir_of_life(age) when is_number(age) do
    IO.puts("Elixir takes 20 years of your life. You are #{age - 20}")
  end

  def life_stage(age) when age < 40 do
    IO.puts("Youngun")
  end

  def life_stage(age) when age >= 40 and age <= 64 do
    IO.puts("mid life criss")
  end

  def life_stage(age) when age > 64 do
    IO.puts("waiting for god!")
  end

  def demo_guards() do
    IO.puts(elixir_of_life("90"))
    IO.puts(elixir_of_life(90))
    IO.puts(life_stage(20))
    IO.puts(life_stage(50))
    IO.puts(life_stage(80))
  end
end
