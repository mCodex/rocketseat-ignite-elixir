defmodule JwtchallengeWeb.UsersView do
  alias Jwtchallenge.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created!",
      user: user
    }
  end

  def render("sign_in.json", %{token: token}), do: %{token: token}
end
