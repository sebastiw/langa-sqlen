defmodule Langasql.Factory do
  use ExMachina.Ecto, repo: Langasql.Repo
  alias Langasql.Ecto.User
  alias Langasql.Ecto.Tag
  alias Langasql.Ecto.Property
  alias Langasql.Ecto.SharedInfo

  def user_factory do
    %User{
      display_name: Faker.Name.name()
    }
  end

  def property_factory do
    type = sequence(:property_key, ["email", "company", "tel"])

    %Property{
      key: build_key(type)
      value: build_value(type),
      user: build(:user)
    }
  end

  def build_key("email") do
    sequence(:email_key, ["Work email", "E-mail", "Private email"])
  end
  def build_key("company") do
    "Company"
  end
  def build_key("tel") do
    sequence(:telephone_key, ["Mobile", "Work phone", "Private number", "Home nr", "Cell"])
  end

  def build_value("email") do
    sequence(:email, &"email-#{&1}@example.com")
  end
  def build_value("tel") do
    Faker.Phone.EnGb.mobile_number()
  end
  def build_value("company") do
    Faker.Company.name()
  end

  def tag_factory do
    %Tag{
      property: build(:property)
      tag: sequence(:tag)
    }
  end
end
