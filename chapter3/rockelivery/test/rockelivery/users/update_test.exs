defmodule Rockelivery.Users.UpdateTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Update

  describe "call/1" do
    test "when there are valid params updates the user" do
      insert(:user)

      params = %{
        "id" => "80546254-2c97-4338-8acc-3e6305d4b523",
        "name" => "Updated User"
      }

      response = Update.call(params)

      assert {:ok, %User{name: "Updated User"}} = response
    end

    test "when user not exists, returns an error" do
      params = %{
        "id" => "80546254-2c97-4338-8acc-3e6305d4b523",
        "name" => "Updated User"
      }

      response = Update.call(params)

      expected_response = {:error, Error.build_user_not_found_error()}

      assert response == expected_response
    end
  end
end
