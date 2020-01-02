defmodule Chronos.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :initials, :string
      add :bed_number, :string
      add :dorm, :string

      timestamps()
    end
  end
end
