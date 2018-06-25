defmodule Bmapp.Watcher do
  @moduledoc """
  The School context.
  """
  import Ecto.Query, warn: false
  alias Bmapp.Repo
  alias Bmapp.Watcher.Location
  alias Bmapp.Watcher.Sensor
  alias Bmapp.Watcher.Measurement
  alias Comeonin.Ecto.Password
  alias Bmapp.Watcher.User


  def genmes ( sensor ) do
    (1..10) |> Enum.each(fn(x) ->
      %Measurement {m_name: "10:" <> Integer.to_string(x*5), m_value: :rand.uniform(100)/1, sensor: sensor}
      |> Repo.insert!
    end)
  end

  def authenticate(role, email, password) do
    user = Repo.get_by(User, role: role, email: email)
    with %{password: digest} <- user,
         true <- Password.valid?(password, digest) do
      {:ok, user}
    else
      _ -> :error
    end
  end

  def list_users(_) do
    Repo.all(User)
  end

  def get_user!(id), do: Repo.get!(User, id)

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end



  def list_locations(_) do
    Repo.all(Location)
  end

  def get_location!(id), do: Repo.get!(Location, id)


  def list_sensors(_) do
    Repo.all(Sensor)
  end

  def get_sensor!(id), do: Repo.get!(Sensor, id)


  def list_measurements(_) do
    Repo.all(Measurement)
  end

  def get_measurement!(id), do: Repo.get!(Measurement, id)



  # links
  def list_locations_for_user(user) do
    IO.inspect(user)
    Ecto.assoc(user, :location) |> Repo.all
  end


  def list_sensors_for_locations(loc) do
    Ecto.assoc(loc, :sensor) |> Repo.all
  end

  def list_measurements_for_sensor(sensor) do
    Ecto.assoc(sensor, :measurement) |> Repo.all
  end

  def list_sensors_for_location(loc_id) do
    loc = get_location!(loc_id)
    Ecto.assoc(loc, :sensor) |> Repo.all
  end
#
#  def list_students_for_class(class) do
#    Ecto.assoc(class, :student) |> Repo.all
#  end
#
  def lookup(id) do
    {:ok,Repo.get_by(User, id: id)}
  end




end
