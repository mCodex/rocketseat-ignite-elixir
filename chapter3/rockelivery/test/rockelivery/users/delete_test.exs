defmodule Rockelivery.Users.GetTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Get

  describe "by_id/1" do
    test "when there is an user with given id, returns the user" do
      insert(:user)

      id = "80546254-2c97-4338-8acc-3e6305d4b523"

      response = Get.by_id(id)

      assert {:ok, %User{name: "User"}} = response
    end

    test "when user not exists, returns an error" do
      id = "80546254-2c97-4338-8acc-3e6305d4b523"

      response = Get.by_id(id)

      expected_response = {:error, Error.build_user_not_found_error()}

      assert response == expected_response
    end
  end
end
