defmodule AgeCalculator.Server do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, ["Hello"])
  end

  def init(init_arg) do
    IO.puts("GenServer Started")
    greetings = %{:greeting => init_arg}
    {:ok, greetings}
  end

  def get_my_greeting(process_id) do
    GenServer.call(process_id, {:get_the_greeting})
  end

  def set_my_greeting(process_id, new_greeting) do
    GenServer.call(process_id, {:set_the_greeting, new_greeting})
  end

  def handle_call({:get_the_greeting}, _from, my_state) do
    current_greeting = Map.get(my_state, :greeting)
    {:reply, current_greeting, my_state}
  end

  def handle_call({:set_the_greeting, the_new_greeting}, _from, my_state) do
    new_state = Map.put(my_state, :greeting, the_new_greeting)
    {:reply, new_state, my_state}
  end
end
