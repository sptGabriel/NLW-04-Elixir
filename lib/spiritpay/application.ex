defmodule Spiritpay.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Spiritpay.Repo,
      # Start the Telemetry supervisor
      SpiritpayWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Spiritpay.PubSub},
      # Start the Endpoint (http/https)
      SpiritpayWeb.Endpoint
      # Start a worker by calling: Spiritpay.Worker.start_link(arg)
      # {Spiritpay.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Spiritpay.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SpiritpayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
