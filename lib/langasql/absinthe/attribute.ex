defmodule Langasql.Absinthe.Attribute do
  use Absinthe.Schema.Notation

  object :attribute do
    field :id, :id
    field :name, :string
    field :value, :string
    field :user, :user
    field :share_views, list_of(:share_view)
  end

  object :attribute_queries do
    field :attributes, list_of(:attribute) do
      resolve(&Langasql.Resolver.Attribute.all/3)
    end
  end

  object :attribute_mutations do
  end
end
