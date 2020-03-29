defmodule Langasql.Absinthe.Property do
  use Absinthe.Schema.Notation

  @desc "A piece of information"
  object :property do
    @desc "Self-explanatory"
    field :id, :id

    @desc "The field name."
    field :key, :string

    @desc "The field value."
    field :value, :string

    @desc "The owner of the property."
    field :user, :user

    @desc "Number of different groups that the property belongs to."
    field :tags, list_of(:tag)
  end
end
