defmodule Core.Actuators.LowHeat do

  @spec cycle() :: no_return()
  def cycle() do
    GenServer.call(:low_heat_actuator, :cycle)
  end
end
