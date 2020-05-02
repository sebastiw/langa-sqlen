defmodule Langasql.Resolver.Misc do
  alias Langasql.Repo
  alias Langasql.Ecto.User
  alias Langasql.Ecto.Property

  def hashable_keys(%User{}) do
    User.hashable_keys()
  end
  def hashable_keys(%Property{}) do
    Property.hashable_keys()
  end

  def get_and_check(ecto, %{id: id} = args) do
    case Repo.get(ecto, id) do
      nil ->
        {:error, "Id #{id} not found"}
      object ->
        {:ok, actual_etag} = etag(object)
        etag = Map.get(args, :etag, :undefined)
        case actual_etag == etag do
          false ->
            {:error, "Etag #{etag} does not match #{actual_etag}"}
          true ->
            object
        end
    end
  end

  def etag(object, _, _) do
    etag(object, hashable_keys(object))
  end

  def etag(object) do
    etag(object, hashable_keys(object))
  end

  def etag(object, keys) do
    value =
      Map.take(object, keys)
      |> Map.to_list
      |> Enum.sort
      |> Keyword.values
      |> IO.iodata_to_binary

    {:ok,
     :crypto.hash(:sha256, value)
     |> Base.encode16}
  end
end
