defmodule Langasql.Absinthe.User do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
    field :display_name, :string
    field :properties, list_of(:property)
    field :shared_info, list_of(:shared_info)
  end

  object :user_queries do
    field :users, list_of(:user) do
      resolve(&Langasql.Resolver.User.all/3)
    end
  end

  object :user_mutations do
  end
end
