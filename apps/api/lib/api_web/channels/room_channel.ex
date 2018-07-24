defmodule ApiWeb.RoomChannel do
  use Phoenix.Channel
  alias ApiWeb.RoomState
  alias Core.Collectors.Temperature
  alias Core.Actuators.{Power, LowHeat, HighHeat, Motor}

  @agent :lobby_state

  def join("room:lobby", _message, socket) do
    send(self(), :after_join)

    {:ok, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("low_heat", _, socket) do
    turn_on_device()
    LowHeat.cycle
    Motor.turn_on

    RoomState.set(1)
    broadcast! socket, "heat:low", %{}

    {:noreply, socket}
  end

  def handle_in("high_heat", _, socket) do
    turn_on_device()
    HighHeat.cycle
    Motor.turn_on

    RoomState.set(2)
    broadcast! socket, "heat:high", %{}

    {:noreply, socket}
  end

  def handle_in("device_off", _, socket) do
    turn_off_device()
    Motor.turn_off

    RoomState.set(0)
    broadcast! socket, "device:off", %{}

    {:noreply, socket}
  end

  def handle_info(:after_join, socket) do
    mode = RoomState.get()

    payload = %{
      temperatures: Temperature.collection,
      mode: mode
    }

    push socket, "latest_temperatures", payload

    {:noreply, socket}
  end

  defp turn_on_device() do
    case Core.Sensors.Power.read do
      0 -> Power.cycle
      _ -> nil
    end
  end

  defp turn_off_device() do
    case Core.Sensors.Power.read do
      1 -> Power.cycle
      _ -> nil
    end
  end
end
