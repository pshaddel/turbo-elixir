defmodule Discuss.Movie do
  use Discuss.Web, :model

  schema "movies" do
    field(:title, :string)
    field(:tagline, :string)
    has_many(:characters, Discuss.Character)
    has_one(:distributor, Discuss.Distributor)
    many_to_many(:actors, Discuss.Actor, join_through: "movies_actors")
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :tagline])
    |> validate_required([:title, :tagline])
  end
end
