defmodule Langasql.Absinthe.SharedInfo do
  use Absinthe.Schema.Notation

  @desc "A shared property."
  object :contact do
    @desc "Self-explanatory."
    field :id, :id

    @desc "The user that is the receiver of the property."
    field :user, :user

    @desc "The shared property."
    field :property, :property

    @desc "An optional comment to this data from the receiver."
    field :comment, :string
  end
end
