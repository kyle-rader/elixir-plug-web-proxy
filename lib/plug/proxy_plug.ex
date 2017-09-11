defmodule PlugWebProxy.ProxyPlug do
  import Plug.Conn

  def init(default_opts) do
    # %{ default_opts | proxy_services: build_proxy_map() }
    default_opts
  end

  def call(conn, _opts) do
    proxy(conn.host, conn)
  end

  def proxy(host, conn) do
    IO.puts "#{conn.method} Request for #{host}"
    conn
      |> put_resp_content_type("text/plain")
      |> send_resp(200, "#{conn.method} Request for #{host}")
  end

  # @service_env_var_name "PROXY_SERVICE_"

  def build_proxy_map(env_vars \\ System.get_env()) do
    env_vars
      |> Enum.filter(fn({key, _}) -> match?("PROXY_SERVICE_"  <> _, key) end)
      |> Enum.reduce(%{}, fn(data, acc) -> convert_env_var(data, acc) end)
  end

  defp convert_env_var({_, val}, acc) do
    [service, port] =  String.split(val, ":")
    Map.put(acc, service, String.to_integer(port))
  end

end
