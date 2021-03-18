defmodule Exflight.Users.CreateOrUpdate do
  alias Exflight.Users.Agent, as: UserAgent

  alias Exflight.Users.User

  def call(%{name: name, email: email, cpf: cpf}) do
    id = UUID.uuid4()

    {:ok, user} = User.build(id, name, email, cpf)

    UserAgent.save(user)

    {:ok, user.id}
  end

  def call(_user_data), do: {:error, "Invalid user params"}
end
