defmodule ApiWeb.TemperatureUpdate do
  @moduledoc false

  use GenServer
  import Core.Broadcast

  @topic :temperature_updates

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: :temperature_update)
  end

  def init(_) do
    listen_to(@topic)

    {:ok, %{}}
  end

  def handle_cast({@topic, {date, temp}}, state) do
    ApiWeb.Endpoint.broadcast! "room:lobby",
      "temperature_update", %{ time: date, temperature: temp }

    {:noreply, state}
  end
end
