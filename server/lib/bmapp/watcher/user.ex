defmodule Bmapp.Watcher.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bmapp.Watcher.User


  schema "users" do
    field :email, :string
    field :name, :string
    field :password, Comeonin.Ecto.Password
    field :role, :string
    field :userid, :string

    has_many :location , Bmapp.Watcher.Location

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :userid, :email, :password, :role])
    |> validate_required([:name, :userid, :email, :password, :role])
  end
end
