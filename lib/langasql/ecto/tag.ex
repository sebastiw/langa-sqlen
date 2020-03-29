defmodule Langasql.Ecto.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  alias Langasql.Ecto.Property

  schema "tags" do
    field :tag, :string

    belongs_to :property, Property

    timestamps()
  end

  def changeset(object, params \\ %{}) do
    object
    |> cast(params, [:tag])
  end
end
