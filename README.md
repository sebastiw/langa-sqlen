# LangaSQL

## Building & Running

It should be as simple as `make`.  It builds and starts the postgres
database in a docker container.  Then it builds the Elixir
application, and migrates the schemas, and then starts.

You can now visit http://localhost:4000/graphiql
or post graphql querys via curl:

    $ curl 'http://localhost:4000/' -H 'content-type: application/json' -d @- <<EOF
    heredoc>  {"query": "query { users { id } }"}
    heredoc>EOF
    {"data":{"users":[{"id":"1"},{"id":"2"},{"id":"3"}]}}

## Schemas

Schemas and migrations are stored in `priv/repo/migrations/` and seeds
(test data) in `priv/repo/seeds.exs`.
