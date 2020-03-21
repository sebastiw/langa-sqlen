defmodule Langasql.Resolver.ContactView do
  alias Langasql.Ecto.ContactView

  def all(_, _, _) do
    {:ok,
     Langasql.Repo.all(ContactView)
     |> Langasql.Repo.preload([:attributes, :user])}
  end
end
