defmodule MeetingBingo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MeetingBingoWeb.Telemetry,
      # Start the Ecto repository
      MeetingBingo.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: MeetingBingo.PubSub},
      # Start Finch
      {Finch, name: MeetingBingo.Finch},
      # Start the Endpoint (http/https)
      MeetingBingoWeb.Endpoint
      # Start a worker by calling: MeetingBingo.Worker.start_link(arg)
      # {MeetingBingo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MeetingBingo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MeetingBingoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
