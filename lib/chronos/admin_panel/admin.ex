defmodule Chronos.AdminPanel.Admin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "admins" do
    field :role, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:role])
    |> validate_required([:role])
    |> unique_constraint(:user_id)
  end
end
