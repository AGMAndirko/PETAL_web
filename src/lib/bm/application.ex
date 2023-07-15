defmodule Bm.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BmWeb.Telemetry,
      # Start the Ecto repository
      Bm.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Bm.PubSub},
      # Start Finch
      {Finch, name: Bm.Finch},
      # Start the Endpoint (http/https)
      BmWeb.Endpoint
      # Start a worker by calling: Bm.Worker.start_link(arg)
      # {Bm.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bm.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BmWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
