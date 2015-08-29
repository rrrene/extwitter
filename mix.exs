defmodule ExTwitter.Mixfile do
  use Mix.Project

  def project do
    [ app: :extwitter,
      version: "0.4.2",
      elixir: "~> 1.0.0",
      deps: deps,
      description: description,
      package: package,
      test_coverage: [tool: ExCoveralls],
      docs: [main: ExTwitter] ]
  end

  # Configuration for the OTP application
  def application do
    [ mod: { ExTwitter, [] },
      applications: [:inets, :ssl, :crypto]]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  def deps do
    [
      {:oauth, github: "tim/erlang-oauth"},
      {:poison, "~> 1.3"},
      {:timex, github: "rrrene/timex"},
      {:exvcr, "~> 0.3", only: [:dev, :test]},
      {:excoveralls, "~> 0.3", only: [:dev, :test]},
      {:meck, "~> 0.8.2", only: :test},
      {:mock, github: "parroty/mock", only: [:dev, :test], branch: "fix"},
      {:ex_doc, "~> 0.6", only: :docs},
      {:earmark, "~> 0.1", only: :docs},
      {:inch_ex, "~> 0.2", only: :docs},
      {:benchfella, github: "alco/benchfella", only: :dev}
    ]
  end

  defp description do
    """
    Twitter client library for elixir.
    """
  end

  defp package do
    [ contributors: ["parroty"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/parroty/extwitter"} ]
  end
end
