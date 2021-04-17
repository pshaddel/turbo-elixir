defmodule Discuss.TopicController do
  use Discuss.Web, :controller
  alias Discuss.Topic
  plug(Discuss.Plugs.Authenticate when action in [:create, :edit, :update, :delete, :new])

  def index(conn, _params) do
    # Fetch all post titles
    # query =
    #   from(p in Topic,
    #     select: p.title and p.id
    #   )
    IO.inspect(conn.assigns)
    data = Repo.all(Topic)
    render(conn, "index.html", data: data)
  end

  def edit(conn, %{"id" => id}) do
    topic = Repo.get(Topic, id)
    changeset = Topic.changeset(topic)
    render(conn, "edit.html", changeset: changeset, topic: topic)
  end

  def update(conn, %{"id" => id, "topic" => topic}) do
    topicStruct = Repo.get(Topic, id)
    changeset = Topic.changeset(topicStruct, topic)

    case Repo.update(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic updated successfully")
        |> redirect(to: topic_path(conn, :index))

      {:error, changeset} ->
        render(conn, "edit.html", changeset: changeset, topic: topicStruct)
    end
  end

  def show(conn, %{"id" => id}) do
    topicStruct = Repo.get(Topic, id)
    %{title: title, id: id} = topicStruct
    render(conn, "detail.html", title: title, id: id)
  end

  def delete(conn, %{"id" => id}) do
    topicStruct = Repo.get(Topic, id)

    case Repo.delete(topicStruct) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic deleted successfully")
        |> redirect(to: topic_path(conn, :index))

      {:error, _changeset} ->
        conn
        |> put_flash(:info, "Deleting Topic Failed")
        |> redirect(to: topic_path(conn, :index))
    end
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, topic} ->
        %{title: title} = topic

        conn
        |> put_flash(:info, "Topic with title " <> title <> " created")
        |> redirect(to: topic_path(conn, :index))

      {:error, changeset} ->
        IO.inspect(changeset)
        render(conn, "new.html", changeset: changeset)
    end
  end
end
