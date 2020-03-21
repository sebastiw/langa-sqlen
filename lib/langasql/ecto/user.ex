defmodule Langasql.Ecto.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Langasql.Ecto.Attribute
  alias Langasql.Ecto.ShareView
  alias Langasql.Ecto.ContactView

  schema "users" do
    field :display_name, :string

    has_many :attributes, Attribute
    has_many :share_views, ShareView
    has_many :contact_views, ContactView

    timestamps()
  end

  def changeset(object, params \\ %{}) do
    object
    |> cast(params, [:display_name])
  end
end
