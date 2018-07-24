defmodule Core.Collectors.Temperature do

  @spec collection() :: list(tuple())
  def collection() do
    GenServer.call(:temperature_collector, :collection)
  end
end
