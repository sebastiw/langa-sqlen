defmodule Langasql.Repo.Migrations.CreateInitialTables do
  use Ecto.Migration

  def change do
    create table("users") do
      add :display_name, :string

      timestamps()
    end

    create table("attributes") do
      add :user_id, references("users", on_delete: :delete_all)
      add :name, :string
      add :value, :string

      timestamps()
    end

    create table("share_views") do
      add :user_id, references("users", on_delete: :delete_all)
      add :attribute_id, references("attributes", on_delete: :nilify_all)
      add :tag, :string

      timestamps()
    end

    create table("contact_views") do
      add :user_id, references("users", on_delete: :delete_all)
      add :attribute_id, references("attributes", on_delete: :delete_all)
      add :comment, :string

      timestamps()
    end
  end
end
