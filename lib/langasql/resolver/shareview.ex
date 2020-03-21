defmodule Langasql.Resolver.ShareView do
  alias Langasql.Ecto.ShareView

  def all(_, _, _) do
    {:ok,
     Langasql.Repo.all(ShareView)
     |> Langasql.Repo.preload([:attributes])}
  end
end
