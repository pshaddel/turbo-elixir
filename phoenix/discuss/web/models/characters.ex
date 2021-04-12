defmodule Discuss.Character do
  use Discuss.Web, :model

  schema "characters" do
    field(:name, :string)
    belongs_to(:movie, Discuss.Movie)
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
