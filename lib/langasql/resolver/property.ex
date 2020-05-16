defmodule Langasql.Resolver.Property do
  alias Langasql.Repo
  import Ecto.Query, only: [from: 2]

  alias Langasql.Ecto.Property
  alias Langasql.Ecto.User
  alias Langasql.Resolver.Misc

  def all(%User{} = user, _, _) do
    %User{properties: properties} = Repo.preload(user, [properties: :tags])

    # Remove extra layer of tags
    properties =
      Enum.map(
        properties,
        fn (%Property{tags: tags} = p) ->
          %{p | tags: Enum.map(tags, &(&1.tag))}
        end)

    {:ok, properties}
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
