defmodule Langasql.Resolver.User do
  alias Langasql.Repo

  alias Langasql.Ecto.User
  alias Langasql.Resolver.Misc

  def all(_, _, _) do
    {:ok, Repo.all(User)}
  end

  def find(_, %{id: id}, _) do
    {:ok, Repo.get(User, id)}
  end

  def create(_, args, _) do
    User.changeset(%User{}, args)
    |> Repo.insert
  end

  def update(_, args, _) do
    case Misc.get_and_check(User, args) do
      %User{} = usr ->
        User.changeset(usr, args)
        |> Repo.update
      error ->
        error
    end
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
