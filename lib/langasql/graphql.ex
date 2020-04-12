defmodule Langasql.GraphQL do
  use Absinthe.Schema

  import_types(Langasql.Absinthe.User)
  import_types(Langasql.Absinthe.Contact)
  import_types(Langasql.Absinthe.Property)
  import_types(Langasql.Absinthe.Tag)
  import_types(Langasql.Absinthe.Queries)

  @desc "All queries"
  query name: :query_api do
    import_fields(:user_queries)
  end

  @desc "All mutations"
  mutation name: :mutation_api do
    import_fields(:user_mutations)
  end
end
