defmodule Langasql.Repo do
  use Ecto.Repo,
    otp_app: :langasql,
    adapter: Ecto.Adapters.Postgres
end
