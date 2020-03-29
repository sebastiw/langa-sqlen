defmodule Langasql.GraphQL do
  use Absinthe.Schema

  import_types(Langasql.Absinthe.User)
  import_types(Langasql.Absinthe.Property)
  import_types(Langasql.Absinthe.Tag)
  import_types(Langasql.Absinthe.SharedInfo)

  query name: :query_api do
    import_fields(:user_queries)
    import_fields(:property_queries)
    import_fields(:tag_queries)
    import_fields(:shared_info_queries)
  end

  mutation do
    import_fields(:user_mutations)
    import_fields(:property_mutations)
    import_fields(:tag_mutations)
    import_fields(:shared_info_mutations)
  end
end
