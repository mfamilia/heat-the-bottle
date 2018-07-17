defmodule Core.Sensors.Temperature do

  @spec read() :: float()
  def read() do
    GenServer.call(:temperature_sensor, :read)
  end
end
