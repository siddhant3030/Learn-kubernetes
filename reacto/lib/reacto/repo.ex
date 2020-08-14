defmodule Reacto.Repo do
  use Ecto.Repo,
    otp_app: :reacto,
    adapter: Ecto.Adapters.Postgres
end
