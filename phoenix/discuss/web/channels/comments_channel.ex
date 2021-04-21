defmodule Discuss.CommentChannel do
  use Discuss.Web, :channel
  alias Discuss.Comment
  alias Discuss.Repo

  def join(name, _params, socket) do
    IO.puts("--------------------------")
    "comments:" <> topic_id = name

    topic =
      Discuss.Topic
      |> Repo.get(topic_id)
      |> Repo.preload(:comments)

    {:ok, %{comments: topic.comments}, assign(socket, :topic, topic)}
  end

  def handle_in(name, %{"content" => content}, socket) do
    topic = socket.assigns.topic

    changeset =
      topic
      |> build_assoc(:comments)
      |> Comment.changeset(%{content: content})

    case name do
      "comment:add" ->
        # changeset = Comment.changeset(%Comment{}, %{content: content})
        case Repo.insert(changeset) do
          {:ok, _comment} ->
            {:reply, :ok, socket}

          {:error, _reason} ->
            {:reply, {:error, %{errors: changeset}, socket}}
        end
    end

    {:reply, :ok, socket}
  end
end
