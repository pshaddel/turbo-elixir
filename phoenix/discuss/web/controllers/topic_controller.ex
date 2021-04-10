defmodule Discuss.TopicController do
  use Discuss.Web, :controller
  alias Discuss.Topic

  def main(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)
    # IO.inspect(topic)
    # IO.inspect(changeset)
    %{"title" => title} = topic

    case Repo.insert(changeset) do
      {:ok, post} ->
        IO.inspect(post)
        render(conn, "new.html", changeset: changeset)

      {:error, changeset} ->
        IO.inspect(changeset)
        render(conn, "new.html", changeset: changeset)
    end
  end
end
