defmodule Core.Temperature.Impl do
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
    |> Convert.from_voltage_to_temperature()
  end

  defp transmission_payload(), do: <<0x01, 0x80, 0x00>>

  defp spi_transfer(pid, payload) do
    pid
    |> SPI.transfer(payload)
  end

  defp spi_read(<<_::size(14), counts::size(10)>>) do
    counts
  end
end
