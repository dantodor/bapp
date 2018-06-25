defmodule Bmapp.Watcher.Measurement do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bmapp.Watcher.Measurement


  schema "measurements" do
    field :m_name, :string
    field :m_value, :float

    belongs_to :sensor, Bmapp.Watcher.Sensor

    timestamps()
  end

  @doc false
  def changeset(%Measurement{} = measurements, attrs) do
    measurements
    |> cast(attrs, [:m_name, :m_value, :sensor_id])
    |> validate_required([:m_name, :m_value, :sensor_id])
    |> foreign_key_constraint(:sensor)
  end
end
