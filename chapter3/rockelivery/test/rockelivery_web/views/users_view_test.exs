defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  alias Rockelivery.User

  test "renders create.json" do
    user = build(:user)
    token = "test123"

    response = render(UsersView, "create.json", token: token, user: user)

    assert %{
             message: "User created!",
             token: "test123",
             user: %User{
               address: "Stree 1",
               age: 42,
               cep: "12345678",
               cpf: "12345678901",
               email: "user@user.com",
               id: "80546254-2c97-4338-8acc-3e6305d4b523",
               inserted_at: nil,
               name: "User",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
