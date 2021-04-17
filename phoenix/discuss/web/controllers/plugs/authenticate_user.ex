defmodule Discuss.Plugs.Authenticate do
  import Plug.Conn
  import Phoenix.Controller

  def init(_params) do
  end

  def call(conn, _params) do
    if conn.assigns[:user] do
      conn
    else
      conn
      |> put_flash(:error, "Cannot access without being authenticated.")
      |> redirect(to: Discuss.Router.Helpers.topic_path(conn, :index))
      |> halt()
    end
  end
end
