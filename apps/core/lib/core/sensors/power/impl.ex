defmodule Core.Sensors.Power.Impl do
  @moduledoc false
  alias ElixirALE.SPI
  alias Core.Convert

  def new() do
    {:ok, pid} = SPI.start_link("spidev0.0")

    pid
  end

  def read_temperature(pid) do
    pid
    |> spi_transfer(transmission_payload())
    |> spi_read
    |> Convert.from_counts_to_volts()
  end

  defp transmission_payload(), do: <<0x01, 0x90, 0x00>>

  defp spi_transfer(pid, payload) do
    SPI.transfer(pid, payload)
  end

  defp spi_read(<<_::size(14), counts::size(10)>>) do
    counts
  end

  def read_state(pid) do
    pid
    |> spi_transfer(transmission_payload())
    |> spi_read
    |> Convert.from_counts_to_volts()
    |> remap
  end

  defp remap(value) do
    case value >= 2.7 do
      false -> 1
      true -> 0
    end
  end
end
