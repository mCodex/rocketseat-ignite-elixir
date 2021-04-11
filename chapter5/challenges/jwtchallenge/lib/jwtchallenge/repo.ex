defmodule Jwtchallenge.Repo do
  use Ecto.Repo,
    otp_app: :jwtchallenge,
    adapter: Ecto.Adapters.Postgres
end
