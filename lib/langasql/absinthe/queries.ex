defmodule Langasql.Absinthe.Queries do
  use Absinthe.Schema.Notation

  alias Langasql.Resolver.Property
  alias Langasql.Resolver.User
  alias Langasql.Resolver.Seal

  object :seal_queries do
    @desc "List all seals"
    field :seals, list_of(:seal) do
      resolve(&Seal.all/3)
    end

    @desc "Fetch a single seal"
    field :seal, :seal do
      arg :id, non_null(:id)
      resolve(&Seal.find/3)
    end
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

    @desc "Update a user"
    field :update_user, :user do
      arg(:id, non_null(:id))
      arg(:etag, non_null(:string))
      arg(:display_name, :string)
      resolve(&User.update/3)
    end

    @desc "Remove a user"
    field :delete_user, :user do
      arg(:id, non_null(:id))
      resolve(&User.delete/3)
    end
  end

  object :property_mutations do
    @desc "Add a new property to a user"
    field :create_property, :property do
      arg(:user_id, non_null(:id))
      arg(:label, non_null(:string))
      arg(:value, non_null(:string))
      resolve(&Property.create/3)
    end

    @desc "Update a users property"
    field :update_property, :property do
      arg(:id, non_null(:id))
      arg(:etag, non_null(:string))
      arg(:label, :string)
      arg(:value, :string)
      resolve(&Property.update/3)
    end

    @desc "Remove a property from a user"
    field :delete_property, :property do
      arg(:id, non_null(:id))
      resolve(&Property.delete/3)
    end
  end
end
