defmodule Newapp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Newapp.Repo,
      # Start the Telemetry supervisor
      NewappWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Newapp.PubSub},
      # Start the Endpoint (http/https)
      NewappWeb.Endpoint
      # Start a worker by calling: Newapp.Worker.start_link(arg)
      # {Newapp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Newapp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    NewappWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
