defmodule Langasql.GraphQL do
  use Absinthe.Schema

  import_types(Langasql.Absinthe.User)
  import_types(Langasql.Absinthe.Attribute)
  import_types(Langasql.Absinthe.ShareView)
  import_types(Langasql.Absinthe.ContactView)

  query name: :query_api do
    import_fields(:user_queries)
    import_fields(:attribute_queries)
    import_fields(:share_view_queries)
    import_fields(:contact_view_queries)
  end

  mutation do
    import_fields(:user_mutations)
    import_fields(:attribute_mutations)
    import_fields(:share_view_mutations)
    import_fields(:contact_view_mutations)
  end
end
