defmodule PlugWebProxyTest.ProxyPlugTest do
  use ExUnit.Case, async: true
  use Plug.Test

  test "can build service proxy map" do

    vars = %{
      "PROXY_SERVICE_FERN" => "as-fern:3003",
      "PROXY_SERVICE_WILLOW" => "as-willow:3011",
      "RANDO_ENV_VAR" => "~/some/dir"
    }

    expected = %{
      "as-fern" => 3003,
      "as-willow" => 3011
    }

    assert PlugWebProxy.ProxyPlug.build_proxy_map(vars) == expected
  end

end
