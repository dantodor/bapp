defmodule BmappWeb.Schema.WatcherTypes do
  use Absinthe.Schema.Notation

  alias BmappWeb.Resolvers

  object :user_session do
    field :token, :string
    field :user, :user
  end


  object :user do
    args :nm, :string
    field :email, :string
    field :name, :string
    field :role, :string
    field :userid, :string
#    field :locations, list_of(:location) do
#      resolve &Resolvers.Watcher.list_locations/3
#    end
  end

  object :location do
    field :id, :id
    field :loc_name, :string
    field :sensors, list_of(:sensor) do
      resolve &Resolvers.Watcher.list_sensors_for_location/3
    end
  end

  object :sensor do
    field :id, :id
    field :s_name, :string
    field :s_average, :float
    field :gtype, :integer
    field :measurements, list_of(:measurement) do
      resolve &Resolvers.Watcher.list_measurements_for_sensor/3
    end
  end

  object :measurement do
    field :m_name, :string
    field :m_value, :float
  end



#  object :user_red do
#    field :name, :string
#    field :email, :string
#    field :id, :string
#  end


end
