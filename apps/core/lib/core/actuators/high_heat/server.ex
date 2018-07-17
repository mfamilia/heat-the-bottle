defmodule Core.Actuators.HighHeat.Server do
  @moduledoc false

  use GenServer
  alias Core.Actuators.HighHeat.Impl

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: :high_heat_actuator)
  end

  def init(_) do
    {:ok, %{pid: Impl.new()}}
  end

  def handle_call(:cycle, _from, state) do
    {:reply, Impl.cycle(state.pid), %{}}
  end
end
