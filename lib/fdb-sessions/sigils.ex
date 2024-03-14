defmodule Sigils do

  def char_list() do
    #forget about char_lists unless diving deeply into Erlang!!!
    word = "David"
    char_list = ~c/A B C FDF = #{word}/

    #IO.puts (String.length(char_list))

    IO.puts (char_list)
    IO.puts (is_binary(char_list))

  end


  def reg_ex() do
    re = ~r/elixir/

    IO.puts "Elixir" =~ re
    IO.puts "elixir" =~ re
  end

end
