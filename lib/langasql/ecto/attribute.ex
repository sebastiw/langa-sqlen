defmodule Langasql.Ecto.Attribute do
  use Ecto.Schema
  import Ecto.Changeset

  alias Langasql.Ecto.User

  schema "attributes" do
    field :name, :string
    field :value, :string

    belongs_to :user, User

    timestamps()
  end

  def changeset(object, params \\ %{}) do
    object
    |> cast(params, [:name, :value])
  end
end
