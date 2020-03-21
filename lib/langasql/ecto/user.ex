defmodule Langasql.Ecto.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Langasql.Ecto.Attribute

  schema "users" do
    field :display_name, :string

    has_many :attributes, Attribute

    timestamps()
  end

  def changeset(object, params \\ %{}) do
    object
    |> cast(params, [:display_name])
  end
end
