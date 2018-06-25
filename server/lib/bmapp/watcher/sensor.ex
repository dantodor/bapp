defmodule Bmapp.Watcher.Sensor do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bmapp.Watcher.Sensor


  schema "sensors" do
    field :s_name, :string
    field :average, :float
    field :gtype, :integer

    belongs_to :location, Bmapp.Watcher.Location

    has_many :measurement , Bmapp.Watcher.Measurement

    timestamps()
  end

  @doc false
  def changeset(%Sensor{} = sensors, attrs) do
    sensors
    |> cast(attrs, [:s_name, :average, :gtype, :location_id])
    |> validate_required([:s_name, :gtype, :location_id])
    |> foreign_key_constraint(:location)
  end
end
