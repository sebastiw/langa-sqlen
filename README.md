# LangaSQL

## Building & Running

It should be as simple as `make`.  It builds and starts the postgres
database in a docker container.  Then it builds the Elixir
application, and migrates the schemas, and then starts.

You can now visit http://localhost:4000/graphiql
