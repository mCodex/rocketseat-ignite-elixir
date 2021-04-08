defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Mox
  import Rockelivery.Factory

  alias Rockelivery.ViaCep.ClientMock

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

      expect(ClientMock, :get_cep_info, fn _cep ->
        {:ok,
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
         }}
      end)

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

  describe "show/2" do
    test "when there is a user with the given id, returns it", %{conn: conn} do
      id = "80546254-2c97-4338-8acc-3e6305d4b523"
      insert(:user)

      response =
        conn
        |> get(Routes.users_path(conn, :show, id))
        |> json_response(:ok)

      expected_response = %{
        "user" => %{
          "address" => "Stree 1",
          "age" => 42,
          "cpf" => "12345678901",
          "email" => "user@user.com",
          "id" => "80546254-2c97-4338-8acc-3e6305d4b523",
          "name" => "User"
        }
      }

      assert expected_response == response
    end

    test "when there is not a user with given id, returns an error", %{conn: conn} do
      id = "80546254-2c97-4338-8acc-3e6305d4b523"

      response =
        conn
        |> get(Routes.users_path(conn, :update, id))
        |> json_response(:not_found)

      expected_response = %{"message" => "User not found!"}

      assert expected_response == response
    end
  end

  describe "update/2" do
    test "when there is a user with the given id, returns update", %{conn: conn} do
      id = "80546254-2c97-4338-8acc-3e6305d4b523"
      insert(:user)

      updated_params = %{
        "name" => "Updated User"
      }

      response =
        conn
        |> put(Routes.users_path(conn, :update, id, updated_params))
        |> json_response(:created)

      expected_response = %{
        "user" => %{
          "address" => "Stree 1",
          "age" => 42,
          "cpf" => "12345678901",
          "email" => "user@user.com",
          "id" => "80546254-2c97-4338-8acc-3e6305d4b523",
          "name" => "Updated User"
        }
      }

      assert expected_response == response
    end

    test "when there is not a user with given id, returns an error", %{conn: conn} do
      id = "80546254-2c97-4338-8acc-3e6305d4b523"

      updated_params = %{
        "name" => "Updated User"
      }

      response =
        conn
        |> put(Routes.users_path(conn, :update, id, updated_params))
        |> json_response(:not_found)

      expected_response = %{"message" => "User not found!"}

      assert expected_response == response
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
