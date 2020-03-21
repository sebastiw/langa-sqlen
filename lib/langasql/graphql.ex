defmodule Langasql.GraphQL do
  use Absinthe.Schema

  # import_types(Absinthe.Type.Custom)

  import_types(Langasql.Absinthe.User)
  import_types(Langasql.Absinthe.Attribute)

  query name: :query_api do
    import_fields(:user_queries)
    import_fields(:attribute_queries)
  end

  mutation do
    import_fields(:user_mutations)
    import_fields(:attribute_mutations)
  end
end
