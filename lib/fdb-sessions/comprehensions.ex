#https://elixirschool.com/en/lessons/basics/comprehensions

defmodule Comprehensions do

  def basics() do
    list = [1, 2, 3, 4]

    for x <- list, do: x*x
  end

  def demo_basics() do
    basics()
  end

end
