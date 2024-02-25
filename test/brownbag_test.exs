defmodule BrownbagTest do
  use ExUnit.Case
  doctest Brownbag

  test "greets the world" do
    assert Brownbag.hello() == :world
  end
end
