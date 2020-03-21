defmodule Langasql.Ecto.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :display_name, :string

    timestamps()
  end

  def changeset(object, params \\ %{}) do
    object
    |> cast(params, [:display_name])
  end
end
