defmodule AgeCalculator.Server do
  use GenServer

  def start_link(args) do
    IO.puts("GenServer start_link Started")
    GenServer.start_link(__MODULE__, args, name: :ac_server)
  end

  def get_age(pid, birthdate) do
    IO.puts("get_age: #{birthdate}")
    GenServer.call(pid, birthdate)
  end

  def handle_call(:result, _from, age) do
    # AgeCalculator.calculate_age(birthdate)
    IO.puts("handle_call: #{:result}, #{age}")
    {:reply, age, age}
  end

  def init(age) do
    IO.puts("GenServer Started")
    {:ok, age}
  end
end
