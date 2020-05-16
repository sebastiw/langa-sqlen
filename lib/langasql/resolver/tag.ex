defmodule Langasql.Resolver.Tag do
  alias Langasql.Repo

  alias Langasql.Ecto.User
  alias Langasql.Ecto.Tag
  alias Langasql.Ecto.Property

  def all(user, _attr, _schema) do
    %User{properties: properties} = Repo.preload(user, [properties: :tags])

    {:ok, properties}
  end
end
