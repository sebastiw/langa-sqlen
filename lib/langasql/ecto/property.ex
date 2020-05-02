defmodule Langasql.Ecto.Property do
  use Ecto.Schema
  import Ecto.Changeset

  alias Langasql.Ecto.User
  alias Langasql.Ecto.Tag

  schema "properties" do
    field :label, :string
    field :value, :string

    has_many :tags, Tag
    belongs_to :user, User

    timestamps()
  end

  def changeset(object, params \\ %{}) do
    object
    |> cast(params, [:user_id, :label, :value])
  end

  def hashable_keys() do
    [:id, :label, :value]
  end
end
