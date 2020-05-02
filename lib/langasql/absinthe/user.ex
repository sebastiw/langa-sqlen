defmodule Langasql.Absinthe.User do
  use Absinthe.Schema.Notation
  alias Langasql.Resolver.Tag
  alias Langasql.Resolver.Contact
  alias Langasql.Resolver.Misc

  @desc "A User in the system."
  object :user do
    @desc "Self-explanatory"
    field :id, :id

    @desc "It is the displayed name of the user when logged in."
    field :display_name, :string

    @desc "Available tags of the user."
    field :tags, list_of(:tag), resolve: &Tag.all/3

    @desc "Information shared with the user."
    field :contacts, list_of(:contact), resolve: &Contact.all/3

    @desc "Etag of the user"
    field :etag, :string, resolve: &Misc.etag/3
  end
end
