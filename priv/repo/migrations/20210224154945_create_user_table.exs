defmodule Spiritpay.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    create table  :users do
      add :name, :string
      add :age, :integer
      add :email, :string
      add :password_hash, :string
      add :username, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
