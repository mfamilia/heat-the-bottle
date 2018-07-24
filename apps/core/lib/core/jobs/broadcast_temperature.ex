defmodule Core.Jobs.ReadTemperature do
  @moduledoc false
  use GenServer
  alias Core.Sensors.Temperature
  import Core.Broadcast

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: :read_temperature)
  end

  def init(_) do
    schedule_initial_job()

    {:ok, nil}
  end

  def handle_info(:perform, state) do
    Temperature.read
    |> broadcast_temperature

    schedule_next_job()

    {:noreply, state}
  end

  defp broadcast_temperature(temp) do
    broadcast_to(:temperature_updates, {DateTime.utc_now, temp})
  end

  defp schedule_initial_job() do
    Process.send_after(self(), :perform, 5_000)
  end

  defp schedule_next_job() do
    Process.send_after(self(), :perform, 60_000)
  end
end
