defmodule Core.Actuators.Motor.Impl do
  @moduledoc false
  alias ElixirALE.GPIO

  @on 1
  @off 0

  def new() do
    gpio_num = Application.get_env(:core, :motor_write)

    {:ok, pid} = GPIO.start_link(gpio_num, :output)

    pid
  end

  def turn_on(pid) do
    GPIO.write(pid, @on)
  end

  def turn_off(pid) do
    GPIO.write(pid, @off)
  end
end
