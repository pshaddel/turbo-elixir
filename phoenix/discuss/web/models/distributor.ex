defmodule Discuss.Distributor do
  use Discuss.Web, :model

  schema "distributors" do
    field(:name, :string)
    belongs_to(:movie, Friends.Movie)
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
