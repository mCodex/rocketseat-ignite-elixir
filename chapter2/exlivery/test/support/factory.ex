defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "User",
      email: "test@test.com",
      cpf: "123456",
      age: 22,
      address: "Street"
    }
  end
end
