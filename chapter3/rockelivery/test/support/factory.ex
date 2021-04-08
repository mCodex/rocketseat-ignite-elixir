defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      "age" => 42,
      "address" => "Stree 1",
      "cep" => "12345678",
      "cpf" => "12345678901",
      "email" => "user@user.com",
      "password" => "123456",
      "name" => "User"
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

  def cep_info_factory do
    %{
      "bairro" => "Sé",
      "cep" => "01001-000",
      "complemento" => "lado ímpar",
      "ddd" => "11",
      "gia" => "1004",
      "ibge" => "3550308",
      "localidade" => "São Paulo",
      "logradouro" => "Praça da Sé",
      "siafi" => "7107",
      "uf" => "SP"
    }
  end
end
