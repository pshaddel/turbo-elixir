defmodule Discuss.AuthController do
  alias Discuss.User
  use Discuss.Web, :controller
  plug(Ueberauth)

  def callback(conn, _params) do
    %{assigns: %{ueberauth_auth: auth}} = conn
    token = auth.credentials.token
    email = auth.info.email
    name = auth.info.name
    provider = "github"
    IO.puts("+++++++")
    user_params = %{email: email, name: name, provider: provider, token: token}
    changeset = Discuss.User.changeset(%Discuss.User{}, user_params)
    signin(conn, changeset)
    render(conn, "index.html")
  end

  def signout(conn, _params) do
    conn
    |> put_session(:user_id, nil)
    |> redirect(to: topic_path(conn, :index))
  end

  defp signin(conn, changeset) do
    case insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back")
        |> put_session(:user_id, user.id)
        |> redirect(to: topic_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Authentication Failed")
        |> redirect(to: topic_path(conn, :index))
    end
  end

  defp insert_or_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)

      user ->
        {:ok, user}
    end
  end
end
