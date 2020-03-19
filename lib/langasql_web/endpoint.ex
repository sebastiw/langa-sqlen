defmodule LangasqlWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :langasql
  use Absinthe.Phoenix.Endpoint

  origin =
    case Mix.env() do
      :prod -> ["https://freinans.com"]
      _ -> false
    end

  socket "/socket", LangasqlWeb.UserSocket,
    websocket: [check_origin: origin],
    longpoll: false

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :langasql,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_langasql_key",
    signing_salt: "4FlJk+o3"

#  plug CORSPlug

  plug LangasqlWeb.Router
end
