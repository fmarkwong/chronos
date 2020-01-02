defmodule Chronos.AdminPanel.Appointment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "appointments" do
    field :date_time, :utc_datetime
    field :name, :string
    field :type, :string
    field :client_id, :id

    timestamps()
  end

  @doc false
  def changeset(appointment, attrs) do
    appointment
    |> cast(attrs, [:name, :type, :date_time])
    |> validate_required([:name, :type, :date_time])
  end
end
