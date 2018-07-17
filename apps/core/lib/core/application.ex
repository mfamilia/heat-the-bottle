defmodule Core.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # List all child processes to be supervised
    children = [
      worker(Core.Sensors.Temperature.Server, []),
      worker(Core.Sensors.Power.Server, []),
      worker(Core.Actuators.Power.Server, []),
      worker(Core.Actuators.LowHeat.Server, []),
      worker(Core.Actuators.HighHeat.Server, []),
      worker(Core.Actuators.Motor.Server, []),
      {NervesNTP, [sync_on_start: true]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Core.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
