defmodule BallotBox.Application do
  @moduledoc """
    A place to vote for things to discuss at our get-together/usergroup

  """
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(BallotBox.Repo, []),
      # Start the endpoint when the application starts
      supervisor(BallotBox.Web.Endpoint, []),
      # Start your own worker by calling: BallotBox.Worker.start_link(arg1, arg2, arg3)
      # worker(BallotBox.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BallotBox.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
