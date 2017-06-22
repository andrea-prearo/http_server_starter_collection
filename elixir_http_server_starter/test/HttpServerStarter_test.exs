defmodule HttpServerStarter.Test do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts HttpServerStarter.Router.init([])

  test "returns Hello World!" do
    conn = conn(:get, "/")

    conn = HttpServerStarter.Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert Enum.member?(conn.resp_headers, {"content-type", "application/json; charset=utf-8"})
    assert conn.resp_body == "Hello World!"
  end

  test "returns Not Found" do
    conn = conn(:get, "/notexisting")

    conn = HttpServerStarter.Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 404
    assert Enum.member?(conn.resp_headers, {"content-type", "text/html; charset=utf-8"})
    assert conn.resp_body == "Not Found"
  end
end
