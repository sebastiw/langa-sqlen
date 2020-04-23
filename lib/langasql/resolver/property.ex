defmodule Langasql.Resolver.Property do
  alias Langasql.Repo

  alias Langasql.Ecto.Property

  def create(_, args, _) do
    ch = Property.changeset(%Property{}, args)
    Repo.insert(ch)
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
