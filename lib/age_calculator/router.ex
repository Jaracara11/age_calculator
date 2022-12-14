defmodule RestApi.Router do
  use Plug.Router

  plug(Plug.Logger)
  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, Jason.encode!(%{status: "Endpoint Ready!"}))
  end

  get "/age/:birthdate" do
    age = AgeCalculator.Server.get_age(:ac_server, birthdate)
    send_resp(conn, 200, Jason.encode!(%{age: age}))
  end

  match _ do
    send_resp(conn, 404, Jason.encode!(%{status: "404: Not Found!"}))
  end
end
