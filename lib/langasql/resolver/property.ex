defmodule Langasql.Resolver.Property do
  alias Langasql.Ecto.Property

  def all(_, _, _) do
    {:ok, Langasql.Repo.all(Property)}
  end
end
