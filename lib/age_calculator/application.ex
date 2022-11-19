defmodule AgeCalculator.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {
        Plug.Cowboy,
        scheme: :http,
        plug: RestApi.Router,
        options: [port: Application.get_env(:age_calculator, :port)]
      }
    ]

    opts = [strategy: :one_for_one, name: AgeCalculator.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
