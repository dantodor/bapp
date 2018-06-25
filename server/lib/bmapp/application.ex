
defmodule Bmapp.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(Bmapp.Repo, []),
      # Start the endpoint when the application starts
      supervisor(BmappWeb.Endpoint, []),
      supervisor(Absinthe.Subscription, [BmappWeb.Endpoint]),
    ]

    opts = [strategy: :one_for_one, name: Bmapp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BmappWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
