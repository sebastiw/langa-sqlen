defmodule Langasql.Resolver.User do
  alias Langasql.Ecto.User

  def all(_, _, _) do
    {:ok,
     Langasql.Repo.all(User)
     |> Langasql.Repo.preload([ attributes: [:share_views],
                              contact_views: [attribute: [:user]]])}
  end
end
