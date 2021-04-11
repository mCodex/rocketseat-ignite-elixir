defmodule Jwtchallenge.Users.Create do
  alias Jwtchallenge.{Repo, User}

  def create(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
