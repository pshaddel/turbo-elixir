defmodule Discuss.User do
  use Discuss.Web, :model
  @derive {Poison.Encoder, only: [:name, :email]}

  schema "users" do
    field(:name, :string)
    field(:provider, :string)
    field(:token, :string)
    field(:email, :string)
    has_many(:topics, Discuss.Topic)
    has_many(:comments, Discuss.Comment)
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :provider, :token, :name])
    |> validate_required([:email, :provider, :token, :name])
  end
end
