defmodule Typee.Repo do
  use Ecto.Repo,
    otp_app: :typee,
    adapter: Ecto.Adapters.Postgres
end
