defmodule Langasql.GraphQL do
  use Absinthe.Schema

  import_types(Langasql.Absinthe.User)
  import_types(Langasql.Absinthe.Property)
  import_types(Langasql.Absinthe.Tag)
  import_types(Langasql.Absinthe.SharedInfo)

  @desc "All queries"
  query name: :query_api do
    import_fields(:user_queries)
  end

  # @desc "All mutations"
  # mutation do
  #   import_fields(:user_mutations)
  # end
end
