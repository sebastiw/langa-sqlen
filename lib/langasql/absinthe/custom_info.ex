defmodule Langasql.Absinthe.CustomInfo do
  use Absinthe.Schema.Notation

  @desc "A piece of local user information for the shared property"
  object :custom_info do
    field :comment, :string
  end
end
