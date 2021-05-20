defmodule Pruebaparks.Repo do
  use Ecto.Repo,
    otp_app: :pruebaparks,
    adapter: Ecto.Adapters.Postgres
end
