defmodule Scriptex.MixProject do
  use Mix.Project

  def project do
    [
      app: :scriptex,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      escript: escript(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:tesla, "~> 1.0.0"},
     {:poison, ">= 3.1.0"},
     {:jason, "~> 1.1"}
    ]
  end

  defp escript do
    [main_module: Scriptex]
  end
end
