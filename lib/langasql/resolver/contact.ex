defmodule Langasql.Resolver.Contact do
  import Ecto.Query, only: [from: 2]
  alias Langasql.Repo

  alias Langasql.Ecto.User
  alias Langasql.Ecto.SharedInfo
  alias Langasql.Ecto.Property

  def all(%User{id: id}, _attr, _schema) do
    shared = Repo.all(
      from(p in SharedInfo,
        preload: [:user, property: :user],
        where: p.user_id == ^id))

    {:ok,
     shared
     # Group the shared properties on the user that shared them.
     # I.e. user -> [property]
     |> Enum.group_by(
     fn (%SharedInfo{property: %Property{user: user}}) -> user end,
     fn (%SharedInfo{id: id, property: prop, comment: c}) ->
       Map.from_struct(prop)
       |> Map.merge(%{custom: %{comment: c}, id: id})
     end)
     |> Enum.map(fn ({k, v}) -> %{user: k, properties: v} end)}
  end
end
