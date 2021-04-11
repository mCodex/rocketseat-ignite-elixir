defmodule Jwtchallenge.Users.Get do
  alias Jwtchallenge.{Repo, User}

  def by_id(user_id) do
    case Repo.get(User, user_id) do
      nil -> {:error, %{status: :bad_request, message: "User not found!"}}
      user -> {:ok, user}
    end
  end
end
