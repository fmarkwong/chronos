defmodule Chronos.Repo.Migrations.CreateAppointments do
  use Ecto.Migration

  def change do
    create table(:appointments) do
      add :name, :string
      add :type, :string
      add :date_time, :utc_datetime
      add :client_id, references(:clients, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:appointments, [:client_id])
  end
end
