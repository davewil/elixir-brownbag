defmodule Functions do
  def pattern_matching_like_overload() do
    handle_result = fn
      {:ok, result} -> IO.puts(result)
     # {:ok, _} -> IO.puts("Never hit as match above uses the second match argument")
      {:error} -> IO.puts("Error")
      _ -> IO.puts("Any other case")
    end

    handle_result.({:ok, "result"})
    handle_result.({:ok, 123})
    handle_result.({:error })
    handle_result.({})
  end

  #recursive function calls
  @spec of([number()]) :: number()
  def of([]), do: 0
  def of([head | tail]), do: (head * 1) + of(tail)

  def recursive_function_call() do
    IO.puts of []
    IO.puts of [1,2,3,4,5]
  end

  #overload by arity
  def hello(), do: "Hello no args"
  def hello(name), do: "Hello, " <> name
  def hello(name1, name2), do: "Hello, #{name1} and #{name2}"

  def say_hello() do
    IO.puts hello()
    IO.puts hello("Olga")
    IO.puts hello(:Olga, :Eldon)
  end

  #pattern matching maps func args!
  def hello2(%{name: person_name} = person) do
    case person do
      %{name: _, last_name: last} -> IO.puts "#{person_name} - #{last}"
      %{name: _} -> IO.puts person_name
    end
  end

  def use_hello2() do
    hello2(%{name: "Dave"})

    hello2(%{name: "Dave", last_name: "Wilks"})
  end

  #guards on functions
  def life_stage(age) when age < 40 do
    IO.puts "Hello youngun"
  end


  def life_stage(age) when age >= 40 and age <= 64 do
    IO.puts "Hello mid life criss"
  end


  def life_stage(age) when age > 64 do
    IO.puts "Hello waiting for god!"
  end

  def life_stage2(age) when is_binary(age) do
    IO.puts "#{age} as a string"
  end

  def life_stage2(age) when is_number(age) do
    IO.puts "You just got younger #{age - 20}"
  end

  def where_you_at() do
    IO.puts life_stage(20)
    IO.puts life_stage(50)
    IO.puts life_stage(80)
    IO.puts life_stage2("90")
    IO.puts life_stage2(90)
  end
end
