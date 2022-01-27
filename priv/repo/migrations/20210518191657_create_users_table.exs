defmodule Exmeal.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :cpf, :cpf
      add :email, :email

      timestamps()
    end

    create unique_index(:users, [:cpf])
    create unique_index(:users, [:email])
end
