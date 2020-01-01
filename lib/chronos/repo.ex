defmodule Chronos.Repo do
  use Ecto.Repo,
    otp_app: :chronos,
    adapter: Ecto.Adapters.Postgres
end
