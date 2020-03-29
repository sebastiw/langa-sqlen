defmodule Langasql.Ecto.SharedInfo do
  use Ecto.Schema
  import Ecto.Changeset

  alias Langasql.Ecto.User
  alias Langasql.Ecto.Property

  schema "shared_information" do
    field :comment, :string

    belongs_to :user, User
    belongs_to :property, Property

    timestamps()
  end

  def changeset(object, params \\ %{}) do
    object
    |> cast(params, [:comment])
  end
end
