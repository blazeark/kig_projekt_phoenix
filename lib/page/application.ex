defmodule Page.Application do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the endpoint when the application starts
      supervisor(PageWeb.Endpoint, []),
      # Start your own worker by calling: Page.Worker.start_link(arg1, arg2, arg3)
      # worker(Page.Worker, [arg1, arg2, arg3]),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Page.Supervisor]
    Supervisor.start_link(children, opts)
    Supervisor.start_link([
      supervisor(MachineLearning, [[]])
    ], [strategy: :one_for_one, name: MachineLearning.Supervisor])
    Supervisor.start_link([
      supervisor(EmailSender, [[]])
    ], [strategy: :one_for_one, name: EmailSender.Supervisor])
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PageWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
