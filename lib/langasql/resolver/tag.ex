defmodule Langasql.Resolver.Tag do
  alias Langasql.Repo

  alias Langasql.Ecto.User

  def all(user, _attr, _schema) do
    %User{properties: properties} = Repo.preload(user, [properties: :tags])

    {:ok, properties}
  end
end
