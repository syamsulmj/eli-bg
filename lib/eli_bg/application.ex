defmodule EliBg.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      EliBg.Repo,
      # Start the Telemetry supervisor
      EliBgWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: EliBg.PubSub},
      # Start the Endpoint (http/https)
      EliBgWeb.Endpoint,
      {EliBg.Services.Multiply, []}
      # Start a worker by calling: EliBg.Worker.start_link(arg)
      # {EliBg.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EliBg.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    EliBgWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
