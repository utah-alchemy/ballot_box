defmodule BallotBox.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use BallotBox.Web, :controller
      use BallotBox.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: BallotBox.Web
      import Plug.Conn
      import BallotBox.Web.Router.Helpers
      import BallotBox.Web.Gettext
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/ballot_box/web/templates",
                        namespace: BallotBox.Web

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import BallotBox.Web.Router.Helpers
      import BallotBox.Web.ErrorHelpers
      import BallotBox.Web.Gettext
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
      import BallotBox.Web.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
