defmodule Rockelivery.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table :users do
      add :addres, :string
      add :age, :integer
      add :cep, :string
      add :cpf, :string
      add :email, :string
      add :password_hash, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:cpf])
  end
end
