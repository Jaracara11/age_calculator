defmodule AgeCalculator.Server do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def get_age(birthdate) do
    age = AgeCalculator.calculate_age(birthdate)
  end

  def push(pid, value) do
    GenServer.cast(pid, {:push, value})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  def init([]) do
    IO.puts("GenServer Started")
    {:ok, []}
  end

  def handle_cast({:push, value}, state) do
    {:noreply, [value | state]}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end
end
