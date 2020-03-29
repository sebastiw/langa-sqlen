defmodule Langasql.Ecto.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Langasql.Ecto.Property
  alias Langasql.Ecto.SharedInfo

  schema "users" do
    field :display_name, :string

    has_many :properties, Property
    has_many :contacts, SharedInfo
    has_many :tags, through: [:properties, :tag]

    timestamps()
  end

  def changeset(object, params \\ %{}) do
    object
    |> cast(params, [:display_name])
  end
end
