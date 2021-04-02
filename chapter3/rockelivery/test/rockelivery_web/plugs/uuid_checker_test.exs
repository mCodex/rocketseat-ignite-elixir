defmodule RockeliveryWeb.Plugs.UUIDCheckerTest do
  use RockeliveryWeb.ConnCase, async: true

  # alias RockeliveryWeb.Plugs.UUIDChecker

  describe "call/1" do
    test "when uuid is invalid, go ahead", %{conn: conn} do
      id = "80546254-2c97-4338-8acc-3e6305d4b523"

      response =
        conn
        |> get(Routes.users_path(conn, :show, id))
        |> json_response(:not_found)

      expected_response = %{"message" => "User not found!"}

      assert response == expected_response
    end

    test "when uuid is invalid returns an error", %{conn: conn} do
      id = "invalid uuid"

      response =
        conn
        |> get(Routes.users_path(conn, :show, id))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid UUID"}

      assert response == expected_response
    end
  end
end
