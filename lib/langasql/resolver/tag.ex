defmodule Langasql.Resolver.Tag do
  alias Langasql.Repo

  alias Langasql.Ecto.Tag
  alias Langasql.Ecto.Property

  def all(user, _attr, _schema) do
    {:ok,
     Repo.all(Ecto.assoc(user, [:properties, :tags]))
     |> Enum.group_by(
     fn (%Tag{tag: tag}) -> tag end,
     fn (%Tag{property_id: id}) -> Repo.get(Property, id) end)
     |> Enum.map(fn ({tag, props}) ->
       %{tag: tag, properties: props}
     end)}
  end
end
