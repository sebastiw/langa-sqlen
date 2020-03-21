defmodule Langasql.Resolver.User do
  alias Langasql.Ecto.User

  def all(_, _, _) do
    {:ok, Langasql.Repo.all(User)}
  end
end
