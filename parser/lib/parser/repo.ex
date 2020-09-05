defmodule Parser.Repo do
  use Ecto.Repo,
    otp_app: :parser,
    adapter: Ecto.Adapters.Postgres
end
