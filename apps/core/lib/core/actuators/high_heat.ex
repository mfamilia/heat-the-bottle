defmodule Core.Actuators.HighHeat do

  @spec cycle() :: atom()
  def cycle() do
    GenServer.call(:high_heat_actuator, :cycle)
  end
end
