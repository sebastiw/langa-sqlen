defmodule Langasql.Absinthe.Seal do
  use Absinthe.Schema.Notation

  @desc "A certification."
  object :seal do
    @desc "Self-explanatory"
    field :id, :id

    field :name, :string

    @desc "A long description"
    field :description, :string

    @desc "Official webpage"
    field :webpage, :string
  end
end
