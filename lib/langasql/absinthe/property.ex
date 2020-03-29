defmodule Langasql.Absinthe.Property do
  use Absinthe.Schema.Notation

  object :property do
    field :id, :id
    field :key, :string
    field :value, :string
    field :user, :user
    field :tags, list_of(:tag)
  end

  object :property_queries do
  end

  object :property_mutations do
  end
end
