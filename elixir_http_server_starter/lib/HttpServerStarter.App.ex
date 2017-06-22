defmodule HttpServerStarter.App do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    port = 4000
    children = [
      Plug.Adapters.Cowboy.child_spec(:http, HttpServerStarter.Router, [{:port, port}], [port: port])
    ]

    opts = [strategy: :one_for_one, name: HttpServerStarter.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
