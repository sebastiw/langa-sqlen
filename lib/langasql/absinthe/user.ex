defmodule Langasql.Absinthe.User do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
    field :display_name, :string
    field :attributes, list_of(:attribute)
    field :contact_views, list_of(:contact_view)
  end

  object :user_queries do
    field :users, list_of(:user) do
      resolve(&Langasql.Resolver.User.all/3)
    end
  end

  object :user_mutations do
  end
end
