defmodule EliBg.Services.Multiply do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, [],
      name: __MODULE__
    )
  end

  def multiply(input) do
    GenServer.call(__MODULE__, {:multiply, input})
  end

  def triple_times_multiply(input) do
    GenServer.call(__MODULE__, {:triple_times_multiply, input})
  end

  def init(_) do
    state = %{multiplier: 2}

    {:ok, state}
  end

  def handle_call({:multiply, input}, _from, state) do
    {:reply, input * state.multiplier, state}
  end

  def handle_call({:triple_times_multiply, input}, _from, state) do
    {:reply, input * state.multiplier * state.multiplier * state.multiplier, state}
  end
end
