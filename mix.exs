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
    [
      extra_applications: [:logger, :sqlite_ecto, :ecto, :cowboy, :plug]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:cowboy, "~> 1.1"},
      {:plug, "~> 1.4"},
      {:sqlite_ecto, "~> 1.1"},
      {:ecto, "~> 1.1"}
    ]
  end
end
