defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "age" => 42,
        "address" => "Stree 1",
        "cep" => "12345678",
        "cpf" => "12345678901",
        "email" => "user@user.com",
        "password" => "123456",
        "name" => "User"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "user" => %{
                 "address" => "Stree 1",
                 "age" => 42,
                 "cpf" => "12345678901",
                 "email" => "user@user.com",
                 "name" => "User",
                 "id" => _id
               }
             } = response
    end

    test "when there are some error, returns the error", %{conn: conn} do
      params = %{
        "age" => 42,
        "address" => "Stree 1"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"],
          "name" => ["can't be blank"],
          "password" => ["can't be blank"]
        }
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "80546254-2c97-4338-8acc-3e6305d4b523"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
