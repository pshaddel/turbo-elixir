defmodule Discuss.User do
  use Discuss.Web, :model

  schema "users" do
    field(:name, :string)
    field(:provider, :string)
    field(:token, :string)
    field(:email, :string)
    has_many(:topics, Discuss.Topic)
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :provider, :token, :name])
    |> validate_required([:email, :provider, :token, :name])
  end
end
