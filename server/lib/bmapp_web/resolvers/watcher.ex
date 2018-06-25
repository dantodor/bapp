defmodule BmappWeb.Resolvers.Watcher do

  import Ecto.Query, warn: false
  alias Bmapp.Repo
  alias Comeonin.Ecto.Password
  alias Bmapp.Watcher
  alias Bmapp.Watcher.User

  def list_locations(user, _, _) do
    {:ok, Watcher.list_locations_for_user(user)}
  end

  def list_sensors_for_location(loc, _, _) do
    {:ok, Watcher.list_sensors_for_locations(loc)}
  end

  def list_measurements_for_sensor(sensor, _, _) do
    {:ok, Watcher.list_measurements_for_sensor(sensor)}
  end

  def list_filtered_locations(_, _, %{context: context}) do
    case context do
      %{current_user: %{id: uid}} ->
        user = Watcher.get_user!(uid)
        {:ok, Watcher.list_locations_for_user(user)}
      _ ->
        {:error, "unauthorized"}
      end
  end

  def list_filtered_sensors(_, %{loc_id: loc_id}, %{context: context}) do
    case context do
      %{current_user: %{id: uid}} ->
        {:ok, Watcher.list_sensors_for_location(loc_id)}
      _ ->
        {:error, "unauthorized"}
    end
  end

  def login_user(_, %{email: email, password: password}, _) do
    case authenticate(email, password) do
      {:ok, user} ->
        token = BmappWeb.Authentication.sign(%{
          id: user.id
        })
        {:ok, %{token: token, user: user}}
      _ ->
        {:error, "incorrect email or password"}
    end
  end

  defp authenticate(email, password) do
    user = Repo.get_by(User, email: email)
    with %{password: digest} <- user,
         true <- Password.valid?(password, digest) do
      {:ok, user}
    else
      _ -> :error
    end
  end



end