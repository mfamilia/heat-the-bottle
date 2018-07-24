defmodule Core.Actuators.Motor do

  @spec turn_on() :: atom()
  def turn_on() do
    GenServer.call(:motor_actuator, :turn_on)
  end

  @spec turn_off() :: atom()
  def turn_off() do
    GenServer.call(:motor_actuator, :turn_off)
  end
end
