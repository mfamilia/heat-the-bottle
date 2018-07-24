defmodule Core.Actuators.Power do

  @spec cycle() :: atom()
  def cycle() do
    GenServer.call(:power_actuator, :cycle)
  end
end
