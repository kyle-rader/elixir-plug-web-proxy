defmodule PlugWebProxy do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, PlugWebProxy.ProxyPlug, [], port: 3000)
    ]

    Logger.info "Starting application..."

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
