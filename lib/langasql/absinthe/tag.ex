defmodule Langasql.Absinthe.Tag do
  use Absinthe.Schema.Notation

  @desc "A group of different properties."
  object :tag do
    @desc "Self-explanatory"
    field :id, :id

    @desc "The name of the tag"
    field :tag, :string
  end
end
