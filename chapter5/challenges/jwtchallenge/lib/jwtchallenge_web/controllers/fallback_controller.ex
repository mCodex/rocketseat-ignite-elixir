defmodule JwtchallengeWeb.FallbackController do
  use JwtchallengeWeb, :controller

  alias JwtchallengeWeb.ErrorView

  def call(conn, {:error, %{status: status, message: message}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", message: message)
  end
end
