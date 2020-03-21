defmodule Langasql.Resolver.Attribute do
  alias Langasql.Ecto.Attribute

  def all(_, _, _) do
    {:ok, Langasql.Repo.all(Attribute)}
  end
end
