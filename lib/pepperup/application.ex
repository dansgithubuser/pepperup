defmodule Pepperup.Application do
  use Application

  require Logger

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    Logger.info "starting"

    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the endpoint when the application starts
      supervisor(PepperupWeb.Endpoint, []),
      # Start your own worker by calling: Pepperup.Worker.start_link(arg1, arg2, arg3)
      # worker(Pepperup.Worker, [arg1, arg2, arg3]),
    ]

    {:ok, _} = HTTPoison.start
    response = HTTPoison.get! "https://stark-mesa-98224.herokuapp.com/"
    Logger.info "response: #{inspect response}"

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pepperup.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PepperupWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
