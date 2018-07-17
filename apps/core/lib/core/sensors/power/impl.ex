defmodule Core.Sensors.Power.Impl do
  @moduledoc false
  alias ElixirALE.GPIO

  def new() do
    gpio = Application.get_env(:core, :power_read)

    {:ok, pid} = GPIO.start_link(gpio, :input)

    pid
  end

  def read_state(pid) do
    pid
    |> GPIO.read
    |> remap
  end

  defp remap(value) do
    case value do
      0 -> true
      _ -> false
    end
  end
end
