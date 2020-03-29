defmodule Langasql.Resolver.Tag do
  alias Langasql.Ecto.Tag

  def all(_, _, _) do
    {:ok,
     Langasql.Repo.all(Tag)
     |> Langasql.Repo.preload([:properties])}
  end
end
