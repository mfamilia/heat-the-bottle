defmodule Core.Actuators.Power do

  @spec cycle() :: no_return()
  def cycle() do
    GenServer.call(:power_actuator, :cycle)
  end
end
