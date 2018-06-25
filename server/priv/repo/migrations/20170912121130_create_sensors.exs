defmodule Bmapp.Repo.Migrations.CreateSensors do
  use Ecto.Migration

  def change do
    create table(:sensors) do
      add :s_name, :string
      add :average, :float
      add :gtype, :integer
      add :location_id, references(:locations, on_delete: :nothing)

      timestamps()
    end

    create index(:sensors, [:location_id])
  end
end
