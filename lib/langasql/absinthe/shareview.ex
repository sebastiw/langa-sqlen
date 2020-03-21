defmodule Langasql.Absinthe.ShareView do
  use Absinthe.Schema.Notation

  object :share_view do
    field :id, :id
    field :user, :user
    field :attribute, :attribute
    field :tag, :string
  end

  object :share_view_queries do
    field :share_views, list_of(:share_view) do
      resolve(&Langasql.Resolver.ShareView.all/3)
    end
  end

  object :share_view_mutations do
  end
end
