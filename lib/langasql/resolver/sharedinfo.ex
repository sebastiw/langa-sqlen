defmodule Langasql.Resolver.SharedInfo do
  alias Langasql.Ecto.SharedInfo

  def all(_, _, _) do
    {:ok,
     Langasql.Repo.all(SharedInfo)
     |> Langasql.Repo.preload([:properties, :user])}
  end
end
