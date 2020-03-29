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

  def find(%{id: id}, _, _) do
    {:ok,
     Langasql.Repo.find(User, id)
    }
  end
end
