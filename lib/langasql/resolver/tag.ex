defmodule Langasql.Resolver.Tag do
  alias Langasql.Repo

  alias Langasql.Ecto.User
  alias Langasql.Ecto.Tag
  alias Langasql.Ecto.Property

  def all(user, _attr, _schema) do
    %User{properties: properties} = Repo.preload(user, [properties: :tags])

    {:ok,
     properties
     |> Enum.flat_map(fn (%Property{tags: tags} = prop) ->
       # make a flat {%Tag,%Property} list
       tags
       |> Enum.map(fn (tag) ->
         {tag, prop}
       end)
     end)
     # Group all properties by tags instead
     |> Enum.group_by(
     fn ({%Tag{tag: tag},_}) -> tag end,
     fn ({_,v}) -> v end)
     # Make Absinthe happy (format)
     |> Enum.map(fn ({tag, props}) ->
       %{tag: tag, properties: props}
     end)}
  end
end
