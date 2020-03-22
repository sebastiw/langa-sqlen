defmodule Langasql.Ecto.Attribute do
  use Ecto.Schema
  import Ecto.Changeset

  alias Langasql.Ecto.User
  alias Langasql.Ecto.ShareView

  schema "attributes" do
    field :name, :string
    field :value, :string

    has_many :share_views, ShareView
    belongs_to :user, User

    timestamps()
  end

  def changeset(object, params \\ %{}) do
    object
    |> cast(params, [:name, :value])
  end
end
