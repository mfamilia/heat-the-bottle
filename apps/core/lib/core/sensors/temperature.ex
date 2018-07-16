defmodule Core.Sensors.Temperature do

  @spec read() :: float.t()
  def read() do
    GenServer.call(:temperature_sensor, :read)
  end
end
