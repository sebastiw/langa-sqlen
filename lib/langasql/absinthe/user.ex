defmodule Langasql.Absinthe.User do
  use Absinthe.Schema.Notation

  @desc "A User in the system."
  object :user do
    @desc "Self-explanatory"
    field :id, :id

    @desc "It is the displayed name of the user when logged in."
    field :display_name, :string

    @desc "All of the users stored information."
    field :properties, list_of(:property)

    @desc "Available tags of the user."
    field :tags, list_of(:tag)

    @desc "Information shared with the user."
    field :contacts, list_of(:contact)
  end

  object :user_queries do

    @desc "List all users"
    field :users, list_of(:user) do
      resolve(&Langasql.Resolver.User.all/3)
    end

    @desc "Fetch a single user"
    field :user, :user do
      arg :id, non_null(:id)
      resolve(&Langasql.Resolver.User.find/3)
    end
  end

  object :user_mutations do
  end
end
