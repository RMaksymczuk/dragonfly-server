defmodule DragonflyServer.Mixfile do
  use Mix.Project

  def project do
    [app: :dragonfly_server,
     version: "0.0.1",
     elixir: "~> 1.0.0",
     deps: deps]
  end

  def application do
    [applications: app_list(Mix.env),
     mod: {DragonflyServer, []}]
  end

  defp deps do
    [
      {:dotenv, "~> 0.0.3"},
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 0.8.0"},
      {:jazz, "~> 0.2.1"},
      {:httpoison, "~> 0.5"},
      {:porcelain, "~> 2.0"}
    ]
  end

  defp app_list(:dev), do: [:dotenv | app_list]
  defp app_list(:test), do: [:dotenv | app_list]
  defp app_list(_), do: app_list
  defp app_list do
    [:logger, :httpoison, :porcelain, :cowboy, :plug]
  end
end
