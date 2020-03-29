defmodule Langasql.Resolver.User do
  alias Langasql.Ecto.User
  alias Langasql.Repo

  def all(_, _, _) do
    {:ok,
     Repo.all(User)
     |> Repo.preload([
       :properties, :tags,
       contacts: [property: [:user]]
     ])}
  end

  def find(_, %{id: id}, _) do
    {:ok,
     Repo.get(User, id)
     |> Repo.preload([
       :properties, :tags,
       contacts: [property: [:user]]
     ])}
  end

  def create(_, args, _) do
    ch = User.changeset(%User{}, args)
    Repo.insert(ch)
  end

  def delete(_, %{id: id}, _) do
    case Repo.get(User, id) do
      nil ->
        {:error, "User #{id} not found"}
      usr ->
        Repo.delete(usr)
    end
  end
end
