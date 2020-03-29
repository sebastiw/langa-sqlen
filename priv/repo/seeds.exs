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
alias Langasql.Ecto.Property
alias Langasql.Ecto.Tag
alias Langasql.Ecto.SharedInfo

%User{id: user1} = Repo.insert!(%User{display_name: Faker.Name.name()})
%User{id: user2} = Repo.insert!(%User{display_name: Faker.Name.name()})
%User{id: user3} = Repo.insert!(%User{display_name: Faker.Name.name()})

%Property{id: attr1} = Repo.insert!(%Property{user_id: user1,
                                              key: "Company name",
                                              value: Faker.Company.name()
                                             })
%Property{id: attr2} = Repo.insert!(%Property{user_id: user1,
                                              key: "Work phone",
                                              value: Faker.Phone.EnGb.number()
                                             })
%Property{id: attr3} = Repo.insert!(%Property{user_id: user1,
                                              key: "Home address",
                                              value: Faker.Address.street_address()
                                             })

Repo.insert!(%Tag{property_id: attr1,
                  tag: "Work"
                 })
Repo.insert!(%Tag{property_id: attr1,
                  tag: "Home"
                 })
Repo.insert!(%Tag{property_id: attr2,
                  tag: "Work"
                 })
Repo.insert!(%Tag{property_id: attr3,
                  tag: "Home"
                 })

Repo.insert!(%SharedInfo{user_id: user2,
                         property_id: attr1,
                         comment: "This idiot"
                        })
Repo.insert!(%SharedInfo{user_id: user2,
                         property_id: attr2
                        })
Repo.insert!(%SharedInfo{user_id: user3,
                         property_id: attr3
                        })
