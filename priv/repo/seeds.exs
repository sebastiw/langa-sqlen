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
alias Langasql.Ecto.ShareView
alias Langasql.Ecto.ContactView

%User{id: user1} = Repo.insert!(%User{display_name: Faker.Name.name()})
%User{id: user2} = Repo.insert!(%User{display_name: Faker.Name.name()})
%User{id: user3} = Repo.insert!(%User{display_name: Faker.Name.name()})

%Attribute{id: attr1} = Repo.insert!(%Attribute{user_id: user1,
                                                name: "Company name",
                                                value: Faker.Company.name()
                                               })
%Attribute{id: attr2} = Repo.insert!(%Attribute{user_id: user1,
                                                name: "Work phone",
                                                value: Faker.Phone.EnGb.number()
                                               })
%Attribute{id: attr3} = Repo.insert!(%Attribute{user_id: user1,
                                                name: "Home address",
                                                value: Faker.Address.street_address()
                                               })

Repo.insert!(%ShareView{attribute_id: attr1,
                        tag: "Work"
                       })
Repo.insert!(%ShareView{attribute_id: attr2,
                        tag: "Work"
                       })
Repo.insert!(%ShareView{attribute_id: attr3,
                        tag: "Home"
                       })

Repo.insert!(%ContactView{user_id: user2,
                          attribute_id: attr1,
                          comment: "This idiot"
                         })
Repo.insert!(%ContactView{user_id: user2,
                          attribute_id: attr2
                         })
Repo.insert!(%ContactView{user_id: user3,
                          attribute_id: attr3
                         })
