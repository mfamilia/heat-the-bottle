defmodule Core.Collectors.Temperature.Server do
  @moduledoc false

  use GenServer
  alias Core.Collectors.Temperature.Impl

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: :temperature_collector)
  end

  def init(_) do
    Impl.new()

    {:ok, %{}}
  end

  def handle_call(:collection, _from, state) do
    {:reply, Impl.get(), state}
  end

  def handle_cast({:temperature_updates, {date, temp}}, state) do
    Impl.add(date, temp)

    {:noreply, state}
  end
end
