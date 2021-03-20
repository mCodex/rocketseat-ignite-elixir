defmodule Exflight.Factory do
  use ExMachina

  alias Exflight.Users.User

  def user_factory() do
    id = UUID.uuid4()

    %User{
      id: id,
      name: "John Doe",
      email: "john_doe@test.com",
      cpf: "123456"
    }
  end
end
