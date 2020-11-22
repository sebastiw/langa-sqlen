defmodule Langasql.Resolver.Seal do
  alias Langasql.Repo

  alias Langasql.Ecto.Seal

  def all(_, _, _) do
    {:ok, Repo.all(Seal)}
  end

  def find(_, %{id: id}, _) do
    {:ok, Repo.get(Seal, id)}
  end

  def create(_, args, _) do
    Seal.changeset(%Seal{}, args)
    |> Repo.insert
  end

  def update(_, %{id: id} = args, _) do
    case Repo.get(Seal, id) do
      %Seal{} = item ->
        Seal.changeset(item, args)
        |> Repo.update
      nil ->
        {:error, "Certification #{id} not found"}
    end
  end

  def delete(_, %{id: id}, _) do
    case Repo.get(Seal, id) do
      nil ->
        {:error, "Certification #{id} not found"}
      item ->
        Repo.delete(item)
    end
  end
end
