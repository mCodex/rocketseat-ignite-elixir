defmodule Jwtchallenge do
  alias Jwtchallenge.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :create
end
