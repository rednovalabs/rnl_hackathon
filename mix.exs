defmodule RnlHackathon.Mixfile do
  use Mix.Project

  def project do
    [app: :rnl_hackathon,
     version: "0.0.1",
     elixir: "~> 1.6",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
      deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {RnlHackathon, []},
     applications: [:phoenix, :phoenix_html, :cowboy, :logger, :gettext,
                    :phoenix_ecto, :postgrex]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.4.10"},
     {:phoenix_ecto, "~> 3.2"},
     {:ecto_sql, "~> 3.1"},
     {:postgrex, "~> 0.15.0"},
     {:phoenix_html, "~> 2.11"},
     {:phoenix_live_reload, "~> 1.2", only: :dev},
     {:poison, "~> 2.0"},
     {:gettext, "~> 0.11"},
     {:plug_cowboy, "~> 1.0"},
     {:earmark, "~> 1.4.2"},
     {:passport, git: "https://github.com/rtroxler/passport.git", branch: 'phx_1.4'}
   ]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"]]
  end
end
