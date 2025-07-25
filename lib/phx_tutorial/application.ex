defmodule PhxTutorial.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhxTutorialWeb.Telemetry,
      PhxTutorial.Repo,
      {DNSCluster, query: Application.get_env(:phx_tutorial, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhxTutorial.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhxTutorial.Finch},
      # Start a worker by calling: PhxTutorial.Worker.start_link(arg)
      # {PhxTutorial.Worker, arg},
      # Start to serve requests, typically the last entry
      PhxTutorialWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxTutorial.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxTutorialWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
