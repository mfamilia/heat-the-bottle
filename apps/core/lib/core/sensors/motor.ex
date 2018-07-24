defmodule Core.Sensors.Motor do

  @spec read() :: integer()
  def read() do
    GenServer.call(:motor_sensor, :read)
  end
end
