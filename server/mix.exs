defmodule Bmapp.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bmapp,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Bmapp.Application, []},
      extra_applications: [:logger, :runtime_tools, :comeonin]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:comeonin_ecto_password, "~> 2.1"},
      {:pbkdf2_elixir, "~> 0.12.0"},
      {:phoenix, "~> 1.3.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, ">= 0.0.0"},
      {:poison, "~> 3.0", override: true},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      {:cors_plug, "~> 1.2"},
      {:distillery, "~> 1.4"},
      {:absinthe, "~> 1.4.0-beta or ~> 1.4.0-rc or ~> 1.4.0", override: true},
      {:absinthe_plug, "~> 1.4.0-beta or ~> 1.4.0-rc or ~> 1.4.0", override: true},
      {:absinthe_phoenix, "~> 1.4.0-beta or ~> 1.4.0-rc or ~> 1.4.0", override: true},
      {:absinthe_relay, "~> 1.4.0-beta or ~> 1.4.0-rc or ~> 1.4.0 or ~> 1.3.0", override: true},
    ]
  end

  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
