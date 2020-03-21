defmodule Langasql.GraphQL do
  use Absinthe.Schema

  # import_types(Absinthe.Type.Custom)

  import_types(Langasql.Absinthe.User)

  query name: :query_api do
    import_fields(:user_queries)
  end

  mutation do
    import_fields(:user_mutations)
  end
end
