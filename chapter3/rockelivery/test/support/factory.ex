defmodule Rockelivery.Factory do
  use ExMachina

  def user_params_factory do
    %{
      age: 42,
      address: "Stree 1",
      cep: "12345678",
      cpf: "12345678901",
      email: "user@user.com",
      password: "123456",
      name: "User"
    }
  end
end
