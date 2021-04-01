defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

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

  def user_factory do
    %User{
      age: 42,
      address: "Stree 1",
      cep: "12345678",
      cpf: "12345678901",
      email: "user@user.com",
      password: "123456",
      name: "User",
      id: "80546254-2c97-4338-8acc-3e6305d4b523"
    }
  end
end
