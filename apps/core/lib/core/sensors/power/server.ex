defmodule Core.Sensors.Power.Server do
  @moduledoc false

  use GenServer
  alias Core.Sensors.Power.Impl

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: :power_sensor)
  end

  def init(_) do
    {:ok, %{pid: Impl.new()}}
  end

  def handle_call(:read, _from, state) do
    {:reply, Impl.read_state(state.pid), state}
  end
end
