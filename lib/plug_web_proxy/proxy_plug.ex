defmodule PlugWebProxy.ProxyPlug do
  import Plug.Conn

  def init(default_opts), do: default_opts

  def call(conn, _opts) do
    proxy(conn.host, conn)
  end

  def proxy(_host, conn) do
    conn
      |> put_resp_content_type("text/plain")
      |> send_resp(200, "Hello World!\n")
  end

end
