defmodule Chronos.AdminPanel.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients" do
    field :bed_number, :string
    field :dorm, :string
    field :initials, :string

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:initials, :bed_number, :dorm])
    |> validate_required([:initials, :bed_number, :dorm])
  end
end
