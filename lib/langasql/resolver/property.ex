defmodule Langasql.Resolver.Property do
  alias Langasql.Repo
  import Ecto.Query, only: [from: 2]

  alias Langasql.Ecto.Property
  alias Langasql.Resolver.Misc

  def all(_, %{user_id: user_id} = args, _) do
    {:ok, Repo.all(from(Property, where: [user_id: ^user_id]))}
  end

  def create(_, args, _) do
    Property.changeset(%Property{}, args)
    |> Repo.insert
  end

  def update(_, args, _) do
    case Misc.get_and_check(Property, args) do
      %Property{} = prop ->
        Property.changeset(prop, args)
        |> Repo.update
      error ->
        error
    end
  end

  def delete(_, %{id: id}, _) do
    case Repo.get(Property, id) do
      nil ->
        {:error, "Property #{id} not found"}
      prp ->
        Repo.delete(prp)
    end
  end
end
