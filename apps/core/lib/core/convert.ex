defmodule Core.Convert do

  def from_counts_to_volts(counts) do
    counts / 1023 * 3.3
  end

  def from_voltage_to_temperature(voltage) do

  end
end
