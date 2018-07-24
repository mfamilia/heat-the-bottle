defmodule Core.Actuators.LowHeat.Server do
  @moduledoc false

  use GenServer
  alias Core.Actuators.LowHeat.Impl

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: :low_heat_actuator)
  end

  def init(_) do
    {:ok, %{pid: Impl.new()}}
  end

  def handle_call(:cycle, _from, state) do
    {:reply, Impl.cycle(state.pid), state}
  end
end
