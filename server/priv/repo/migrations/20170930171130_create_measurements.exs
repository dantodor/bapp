defmodule Bmapp.Repo.Migrations.CreateMeasurements do
  use Ecto.Migration

  def change do
    create table(:measurements) do
      add :m_name, :string
      add :m_value, :float
      add :sensor_id, references(:sensors, on_delete: :nothing)

      timestamps()
    end

    create index(:measurements, [:sensor_id])
  end
end
