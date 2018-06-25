
defmodule BmappWeb do

  def controller do
    quote do
      use Phoenix.Controller, namespace: BmappWeb
      import Plug.Conn
      import BmappWeb.Router.Helpers
      import BmappWeb.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/bmapp_web/templates",
                        namespace: BmappWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 2, view_module: 1]

      import BmappWeb.Router.Helpers
      import BmappWeb.ErrorHelpers
      import BmappWeb.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import BmappWeb.Gettext
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
