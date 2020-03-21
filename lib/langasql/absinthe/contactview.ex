defmodule Langasql.Absinthe.ContactView do
  use Absinthe.Schema.Notation

  object :contact_view do
    field :id, :id
    field :user, :user
    field :attribute, :attribute
    field :comment, :string
  end

  object :contact_view_queries do
    field :contact_views, list_of(:contact_view) do
      resolve(&Langasql.Resolver.ContactView.all/3)
    end
  end

  object :contact_view_mutations do
  end
end
