defmodule Exflight.Users.CreateOrUpdate do
  alias Exflight.Users.Agent, as: UserAgent

  alias Exflight.Users.User

  def call(%{name: name, email: email, cpf: cpf}) do
    id = UUID.uuid4()

    id
    |> User.build(name, email, cpf)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}) do
    UserAgent.save(user)

    {:ok, user.id}
  end

  defp save_user({:error, _reason} = error), do: error
end
