
defmodule BmappWeb.Router do
  use BmappWeb, :router

  pipeline :api do
    plug CORSPlug, origin: ["*"]
    plug :accepts, ["json"]
    plug BmappWeb.Context
  end

  scope "/" do
    pipe_through :api

    forward "/api", Absinthe.Plug,
      schema: BmappWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: BmappWeb.Schema,
      socket: BmappWeb.UserSocket
  end

end
