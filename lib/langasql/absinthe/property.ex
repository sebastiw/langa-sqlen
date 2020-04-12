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

    @desc "An optional comment on this data from the receiver."
    field :comment, :string
  end
end
