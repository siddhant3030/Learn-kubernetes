defmodule Eldeploy.Repo do
  use Ecto.Repo,
    otp_app: :eldeploy,
    adapter: Ecto.Adapters.Postgres
end
