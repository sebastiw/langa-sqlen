defmodule LangasqlWeb.Router do
  use LangasqlWeb, :router

  pipeline :api do
    plug LangasqlWeb.Context
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: LangasqlWeb.GraphQL

    forward "/", Absinthe.Plug, schema: LangasqlWeb.GraphQL
  end
end
