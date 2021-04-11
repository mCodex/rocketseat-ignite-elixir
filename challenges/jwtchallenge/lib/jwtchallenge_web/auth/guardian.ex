defmodule JwtchallengeWeb.Auth.Guardian do
  use Guardian, otp_app: :jwtchallenge

  alias Jwtchallenge.User
  alias Jwtchallenge.Users.Get, as: UserGet

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> UserGet.by_id()
  end

  def authenticate(%{"id" => user_id, "password" => password}) do
    with {:ok, %User{password_hash: hash} = user} <- UserGet.by_id(user_id),
         true <- Pbkdf2.verify_pass(password, hash),
         {:ok, token, _claims} <- encode_and_sign(user) do
      {:ok, token}
    else
      false -> {:error, %{status: :unauthorized, message: "Please verify your credentials"}}
      error -> error
    end
  end

  def authenticate(_), do: {:error, %{status: :bad_request, message: "Invalid or missing params"}}
end
