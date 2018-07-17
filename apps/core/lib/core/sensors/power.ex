defmodule Core.Sensors.Power do

  @spec read() :: boolean()
  def read() do
    GenServer.call(:power_sensor, :read)
  end
end
