defmodule Langasql.Absinthe.Attribute do
  use Absinthe.Schema.Notation

  object :attribute do
    field :id, :id
    field :user, :user
    field :name, :string
    field :value, :string
  end

  object :attribute_queries do
    field :attributes, list_of(:attribute) do
      resolve(&Langasql.Resolver.Attribute.all/3)
    end
  end

  object :attribute_mutations do
  end
end
