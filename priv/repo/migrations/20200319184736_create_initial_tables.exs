defmodule Langasql.Repo.Migrations.CreateInitialTables do
  use Ecto.Migration

  def change do
    create table("users") do
      add :display_name, :string

      timestamps()
    end

    create table("properties") do
      add :user_id, references("users", on_delete: :delete_all)
      add :key, :string
      add :value, :string

      timestamps()
    end

    create table("tags") do
      add :property_id, references("properties")
      add :tag, :string

      timestamps()
    end

    create table("shared_information") do
      add :user_id, references("users", on_delete: :delete_all)
      add :property_id, references("properties", on_delete: :delete_all)
      add :comment, :string

      timestamps()
    end
  end
end
