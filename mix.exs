defmodule PlugWebProxy.Mixfile do
  use Mix.Project

  def project do
    [
      app: :plug_web_proxy,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    applications(Mix.env)
  end

  defp applications(:dev) do
    applications(:all) ++ [extra_applications: [:remix]]
  end

  defp applications(_all) do
    [
      extra_applications: [:logger],
      mod: {PlugWebProxy,[]},
      env: [cowboy_port: 3000]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:cowboy, "~> 1.1.2"},
      {:plug, "~> 1.3.4"},
      {:httpoison, "~> 0.13.0"},
      {:mix_test_watch, "~> 0.3", only: :dev, runtime: false},
      {:remix, "~> 0.0.1", only: :dev}
    ]
  end
end
