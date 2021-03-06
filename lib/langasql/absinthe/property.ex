defmodule Langasql.Absinthe.Property do
  use Absinthe.Schema.Notation

  alias Langasql.Resolver.Misc

  @desc "A piece of information"
  object :property do
    @desc "Self-explanatory"
    field :id, :id

    @desc "The field name."
    field :label, :string

    @desc "The field value."
    field :value, :string

    @desc "An optional comment on this data from the receiver."
    field :custom, :custom_info

    @desc "Etag of the property"
    field :etag, :string, resolve: &Misc.etag/3

    @desc "The property is part of the following tags"
    field :tags, list_of(:string)
  end
end
