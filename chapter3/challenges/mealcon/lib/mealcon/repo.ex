defmodule Mealcon.Repo do
  use Ecto.Repo,
    otp_app: :mealcon,
    adapter: Ecto.Adapters.Postgres
end
