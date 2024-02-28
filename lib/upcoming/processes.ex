defmodule Example do

  #simple spawn example
  def add(a, b) do
    IO.puts(a+b)
  end

  def demo_spawn_add() do
    spawn(Example, :add, [2,3])
  end

  #message passing example
  def listen do
    receive do
      {:ok, "hello"} -> IO.puts("World")
    end

    listen()
  end

  def demo_message_passing() do
    pid = spawn(Example, :listen, [])

    send pid, {:ok, "hello"}
    send pid, :ok
  end

  #process linking
  def explode, do: exit(:kaboom)

  def demo_process_linking() do
    spawn(Example, :explode, [])

    spawn_link(Example, :explode, [])
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Example, :explode, [])

    receive do
      {:EXIT, _from_pid, reason} -> IO.puts("Exit reason: #{reason}")
    end
  end

  #process monitoring
  def run_2 do
    spawn_monitor(Example, :explode, [])

    receive do
      {:DOWN, _ref, :process, _from_pid, reason} -> IO.puts("Exit reason: #{reason}")
    end
  end

  #agents
  def demo_agents_1() do
    {:ok, agent}  = Agent.start_link(fn -> [1,2,3] end)

    Agent.update(agent, fn (state) -> state ++ [4,5] end)

    Agent.get(agent, &(&1))
  end

  def demo_agents_2() do
    Agent.start_link(fn -> [1,2,3] end, name: Numbers)

    Agent.get(Numbers, &(&1))
  end

  #taks
  def double(x) do
    :timer.sleep(2000)
    x * 2
  end

  def demo_tasks() do
    task = Task.async(Example, :double, [2000])

    IO.puts "Doing some other stuff"

    Task.await(task)
  end

end
