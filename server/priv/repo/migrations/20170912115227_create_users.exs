defmodule Bmapp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :userid, :string
      add :email, :string
      add :password, :string
      add :role, :string

      timestamps()
    end

  end
end
