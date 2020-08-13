defmodule Newapp.Repo do
  use Ecto.Repo,
    otp_app: :newapp,
    adapter: Ecto.Adapters.Postgres
end
