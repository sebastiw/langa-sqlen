defmodule Langasql.Resolver.User do
  alias Langasql.Repo

  alias Langasql.Ecto.User

  def all(_, _, _) do
    {:ok, Repo.all(User)}
  end

  def find(_, %{id: id}, _) do
    {:ok, Repo.get(User, id)}
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
