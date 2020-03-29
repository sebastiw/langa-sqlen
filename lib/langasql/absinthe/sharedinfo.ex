defmodule Langasql.Absinthe.SharedInfo do
  use Absinthe.Schema.Notation

  object :shared_info do
    field :id, :id
    field :user, :user
    field :property, :property
    field :comment, :string
  end

  object :shared_info_queries do
  end

  object :shared_info_mutations do
  end
end
