defmodule Langasql.Absinthe.Tag do
  use Absinthe.Schema.Notation

  @desc "A group of different properties."
  object :tag do
    @desc "The name of the tag"
    field :tag, :string

    @desc "Properties that belong to this tag."
    field :properties, list_of(:property)
  end
end
