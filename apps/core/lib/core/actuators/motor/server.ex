defmodule Core.Actuators.Motor.Server do
  @moduledoc false

  use GenServer
  alias Core.Actuators.Motor.Impl

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: :motor_actuator)
  end

  def init(_) do
    {:ok, %{pid: Impl.new()}}
  end

  def handle_call(:turn_on, _from, state) do
    {:reply, Impl.turn_on(state.pid), state}
  end

  def handle_call(:turn_off, _from, state) do
    {:reply, Impl.turn_off(state.pid), state}
  end
end
