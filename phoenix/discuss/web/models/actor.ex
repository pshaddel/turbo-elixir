defmodule Discuss.Actor do
  use Discuss.Web, :model

  schema "actors" do
    field(:name, :string)
    many_to_many(:movies, Discuss.Movie, join_through: "movies_actors")
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
