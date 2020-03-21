defmodule Langasql.Ecto.ContactView do
  use Ecto.Schema
  import Ecto.Changeset

  alias Langasql.Ecto.User
  alias Langasql.Ecto.Attribute

  schema "contact_views" do
    field :comment, :string

    belongs_to :user, User
    belongs_to :attribute, Attribute

    timestamps()
  end

  def changeset(object, params \\ %{}) do
    object
    |> cast(params, [:comment])
  end
end
