defmodule Langasql.Resolver.User do
  alias Langasql.Ecto.User

  def all(_, _, _) do
    {:ok,
     Langasql.Repo.all(User)
     |> Langasql.Repo.preload([
       :properties, :tags,
       contacts: [property: [:user]]
     ])}
  end

  def find(_, %{id: id}, _) do
    {:ok,
     Langasql.Repo.get(User, id)
     |> Langasql.Repo.preload([
       :properties, :tags,
       contacts: [property: [:user]]
     ])}
  end
end
