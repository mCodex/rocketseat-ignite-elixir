defmodule Githubrepogetter.Repo do
  use Ecto.Repo,
    otp_app: :githubrepogetter,
    adapter: Ecto.Adapters.Postgres
end
