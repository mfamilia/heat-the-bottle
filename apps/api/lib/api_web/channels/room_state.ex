defmodule ApiWeb.RoomState do
  def start_link(initial_state) do
    Agent.start_link(fn -> initial_state end, name: __MODULE__)
  end

  def get() do
    Agent.get(__MODULE__, fn s -> s end)
  end

  def set(mode) do
    Agent.update(__MODULE__, fn _ -> mode end)
  end
end
