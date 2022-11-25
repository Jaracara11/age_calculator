defmodule AgeCalculator.Application do
  use Application

  @impl true
  def start(_type, _args) do
    port = Application.get_env(:age_calculator, :port)
    {AgeCalculator.Server.Worker, []}
    children = [
      {
        Plug.Cowboy,
        scheme: :http,
        plug: RestApi.Router,
        options: [port: Application.get_env(:age_calculator, :port)]
      }
    ]
    IO.puts("Application is running on port: #{port}")
    opts = [strategy: :one_for_one, name: AgeCalculator.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
