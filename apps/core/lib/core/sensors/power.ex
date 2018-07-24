defmodule Core.Sensors.Power do

  @spec read() :: integer()
  def read() do
    GenServer.call(:power_sensor, :read)
  end
end
