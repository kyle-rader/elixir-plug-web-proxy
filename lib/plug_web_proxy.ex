defmodule PlugWebProxy do
  use Application
  require Logger

  def start(_type, _args) do

    port = Application.get_env(:PlugWebProxy, :cowboy_port, 3000)

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, PlugWebProxy.ProxyPlug, [], port: port)
    ]

    Logger.info "Starting application on port #{port}..."

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
