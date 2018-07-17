defmodule Core.Actuators.HighHeat do

  @spec cycle() :: no_return()
  def cycle() do
    GenServer.call(:high_heat_actuator, :cycle)
  end
end
