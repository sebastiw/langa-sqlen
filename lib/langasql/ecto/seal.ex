defmodule Langasql.Ecto.Seal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "seals" do
    field :name, :string
    field :description, :string
    field :webpage, :string

    timestamps()
  end

  def changeset(object, params \\ %{}) do
    object
    |> cast(params, [:name, :description, :webpage])
  end
end
