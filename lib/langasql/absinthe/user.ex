defmodule Langasql.Absinthe.User do
  use Absinthe.Schema.Notation
  alias Langasql.Resolver.User

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
      resolve(&User.all/3)
    end

    @desc "Fetch a single user"
    field :user, :user do
      arg :id, non_null(:id)
      resolve(&User.find/3)
    end
  end

  object :user_mutations do

    @desc "Insert a new user"
    field :create_user, :user do
      arg(:display_name, :string)
      resolve(&User.create/3)
    end

    @desc "Remove a user"
    field :delete_user, :user do
      arg(:id, :id)
      resolve(&User.delete/3)
    end
  end
end
