defmodule Core.Temperature.Server do
  @moduledoc false

  use GenServer
  alias Core.Sensors.Temperature.Impl

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: :temperature_sensor)
  end

  def init(_) do
    {:ok, %{}}
  end

  def handle_call(:read, _from, _state) do
    {:reply, Impl.read(), %{}}
    end
end
