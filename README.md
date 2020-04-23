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

To connect to the database use `make postgres-connect` after starting the db.

# GraphQL

For more information about GraphQL, visit https://graphql.org
For information about the available queries and help writing queries
visit http://localhost:4000/graphiql

## Queries

GraphQL queries are used when you want to fetch data.

The structure of GraphQL requests starts with the type which of the
request, in this case a `query` and then what to query, for instance
getting all the `users`. Then GraphQL need to know which fields you
are interested in. In this example we are interested in the display
names of the users.

```
query {
  users {
    display_name
  }
}
```

Observe that it is possible to use both snake_case as well as
camelCase.

If we want sub objects of the users we can just add them to the query as follows.

```
query {
  users {
    displayName,
    tags {
      tag,
      properties {
        id,
        label,
        value
      }
    }
  }
}
```

This will return all properties tied to all tags for all users.
Example:

```
{
  "data": {
    "users": [
      {
        "displayName": "Bradly Beer",
        "tags": [
          {
            "properties": [
              {
                "label": "Company name",
                "value": "Goldner-Herman"
              },
              {
                "label": "Home address",
                "value": "270 Stefanie Summit"
              }
            ],
            "tag": "Home"
          },
          {
            "properties": [
              {
                "label": "Company name",
                "value": "Goldner-Herman"
              },
              {
                "label": "Work phone",
                "value": "07618 548784"
              }
            ],
            "tag": "Work"
          }
        ]
      },
      {
        "displayName": "Melissa Bartell",
        "tags": [
          {
            "properties": [
              {
                "label": "Company name",
                "value": "Balistreri Inc"
              },
              {
                "label": "Home address",
                "value": "3 Lottie Mission"
              }
            ],
            "tag": "Home"
          },
          {
            "properties": [
              {
                "label": "Company name",
                "value": "Balistreri Inc"
              },
              {
                "label": "Work phone",
                "value": "+447571 806347"
              }
            ],
            "tag": "Work"
          }
        ]
      },
      {
        "displayName": "Ms. Joseph Moen",
        "tags": []
      }
    ]
  }
}
```

If you are only interested in one user you can filter by `id`.

```
query {
  user(id: "2") {
     displayName
  }
}
```

You can also use parameters for your requests

```
query my_user_q($my_id: ID!) {
  user(id: $my_id) {
    displayName
  }
}
```
Then send the `my_id` value as a parameter object

```
{"my_id": 2}
```

In curl the data json looks like:

```
{"query": "query my_user_q($my_id: ID!) { user(id: $my_id) { displayName } }",
 "variables": "{\"my_id\": 2}"
}
```

## Mutations

Mutations are used when you want to change the data. Example mutations
are create and delete. You also need to specify some fields for the
resulting object. In this case we only care for which `id` is created.

```
mutation {
  create_user(displayName: "Seba") {
    id
  }
}
```

```
mutation {
  delete_user(id: 4) {
    displayName
  }
}
```

## Subscriptions

Currently not supported within this project.

GraphQLs subscription API is used when a service wants to subscribe
for data changes on objects.
