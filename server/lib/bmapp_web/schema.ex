
defmodule BmappWeb.Schema do
  use Absinthe.Schema


  import_types __MODULE__.WatcherTypes

  query do

    field :locs, list_of(:location) do
      resolve &BmappWeb.Resolvers.Watcher.list_filtered_locations/3
    end

    field :sensors, list_of(:sensor) do
      arg :loc_id, non_null(:integer)
      resolve &BmappWeb.Resolvers.Watcher.list_filtered_sensors/3
    end

  end


  mutation do
    field :login_user, :user_session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      resolve &BmappWeb.Resolvers.Watcher.login_user/3
    end


  end



end
