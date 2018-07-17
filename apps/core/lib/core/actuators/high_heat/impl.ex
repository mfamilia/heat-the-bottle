defmodule Core.Actuators.HighHeat.Impl do
  @moduledoc false
  alias ElixirALE.GPIO

  @high 1
  @low 0

  def new() do
    gpio_num = Application.get_env(:core, :high_heat_write)

    {:ok, pid} = GPIO.start_link(gpio_num, :output)

    pid
  end

  def cycle(pid) do
    delay = Application.get_env(:core, :pin_value_switch_delay)

    GPIO.write(pid, @high)

    Process.sleep(delay)

    GPIO.write(pid, @low)
  end
end
