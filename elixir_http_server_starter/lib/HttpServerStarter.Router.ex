defmodule HttpServerStarter.Router do
  use Plug.Router
  require Logger

  plug Plug.Logger
  plug :match
  plug :dispatch

  def init(opts) do
    port = Keyword.get(opts, :port)
    if port do
      Logger.info "Router (#{inspect self()}) listening on port #{port}"
    end
  end

  get "/" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{:message => "Hello Elixir!", :success => true}))
  end

  match _ do
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(404, "Not Found")
  end
end
