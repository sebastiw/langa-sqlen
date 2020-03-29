defmodule Langasql.Absinthe.Tag do
  use Absinthe.Schema.Notation

  object :tag do
    field :id, :id
    field :tag, :string
  end

  object :tag_queries do
  end

  object :tag_mutations do
  end
end
