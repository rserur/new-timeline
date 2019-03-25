defmodule NewTimeline.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :is_active, :boolean, default: false
    field :name, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :name, :is_active])
    |> validate_required([:username, :name, :is_active])
    |> unique_constraint(:username)
  end
end
