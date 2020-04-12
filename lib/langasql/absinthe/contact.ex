defmodule Langasql.Absinthe.Contact do
  use Absinthe.Schema.Notation

  @desc "A shared contact"
  object :contact do
    @desc "The user that is the receiver of the property."
    field :user, :user

    @desc "The properties that the user have shared."
    field :properties, list_of(:property)
  end
end
