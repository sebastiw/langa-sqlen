defmodule Langasql.Ecto.ShareView do
  use Ecto.Schema
  import Ecto.Changeset

  alias Langasql.Ecto.Attribute

  schema "share_views" do
    field :tag, :string

    belongs_to :attribute, Attribute

    timestamps()
  end

  def changeset(object, params \\ %{}) do
    object
    |> cast(params, [:tag])
  end
end
