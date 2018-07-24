defmodule Core.Collectors.Temperature.Impl do
  @moduledoc false
  @key :latest_temperatures

  alias Core.Storage
  import Core.Broadcast

  def new() do
    listen_to(:temperature_updates)
  end

  def get() do
    Storage.get(@key)
  end

  def add(time, temp) do
    size = Application.get_env(:core, :max_temperature_readings)

    collection = get()
      |> default()
      |> Enum.into([%{time: time, temperature: temp}])
      |> Enum.take(size)

    Storage.set(@key, collection)
  end

  defp default(value) do
    case value do
      nil -> []
      x -> x
    end
  end
end
