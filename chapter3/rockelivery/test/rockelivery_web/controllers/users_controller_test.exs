defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Mox
  import Rockelivery.Factory

  alias Rockelivery.ViaCep.ClientMock
  alias RockeliveryWeb.Auth.Guardian

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
        {:ok, build(:cep_info)}
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
    setup %{conn: conn} do
      user = insert(:user)
      {:ok, token, _claims} = Guardian.encode_and_sign(user)

      conn = put_req_header(conn, "authorization", "Bearer #{token}")

      {:ok, conn: conn}
    end

    test "when there is a user with the given id, returns it", %{conn: conn} do
      id = "80546254-2c97-4338-8acc-3e6305d4b523"

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
      id = "c865ca08-eba3-43e3-87c6-af7c95951bc8"

      response =
        conn
        |> get(Routes.users_path(conn, :update, id))
        |> json_response(:not_found)

      expected_response = %{"message" => "User not found!"}

      assert expected_response == response
    end
  end

  describe "update/2" do
    setup %{conn: conn} do
      user = insert(:user)
      {:ok, token, _claims} = Guardian.encode_and_sign(user)

      conn = put_req_header(conn, "authorization", "Bearer #{token}")

      {:ok, conn: conn}
    end

    test "when there is a user with the given id, returns update", %{conn: conn} do
      id = "80546254-2c97-4338-8acc-3e6305d4b523"

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
      id = "c865ca08-eba3-43e3-87c6-af7c95951bc8"

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
    setup %{conn: conn} do
      user = insert(:user)
      {:ok, token, _claims} = Guardian.encode_and_sign(user)

      conn = put_req_header(conn, "authorization", "Bearer #{token}")

      {:ok, conn: conn}
    end

    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "80546254-2c97-4338-8acc-3e6305d4b523"

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
