defmodule Bmapp.Watcher.Location do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bmapp.Watcher.Location


  schema "locations" do
    field :loc_name, :string

    belongs_to :user, Bmapp.Watcher.User

    has_many :sensor , Bmapp.Watcher.Sensor

    timestamps()
  end

  @doc false
  def changeset(%Location{} = location, attrs) do
    location
    |> cast(attrs, [:loc_name,:user_id])
    |> validate_required([:loc_name])
    |> foreign_key_constraint(:user)
  end
end
