# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Langasql.Repo.insert!(%Langasql.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Langasql.Repo
alias Langasql.Ecto.User
alias Langasql.Ecto.Attribute

%User{id: user1} = Repo.insert!(%User{display_name: Faker.Name.name()})
Repo.insert!(%Attribute{user_id: user1,
                        name: "Company name",
                        value: Faker.Company.name()})
