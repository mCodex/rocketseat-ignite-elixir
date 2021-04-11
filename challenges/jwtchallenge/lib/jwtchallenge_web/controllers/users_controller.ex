defmodule JwtchallengeWeb.UsersController do
  use JwtchallengeWeb, :controller

  alias Jwtchallenge.User

  alias JwtchallengeWeb.Auth.Guardian
  alias JwtchallengeWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Jwtchallenge.create_user(params) do
      conn
      |> put_status(:ok)
      |> render("create.json", user: user)
    end
  end

  def sign_in(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", token: token)
    end
  end
end
