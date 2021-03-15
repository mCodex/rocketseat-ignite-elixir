defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response = User.build("Street", "User", "test@test.com", "123456", 22)

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when are invalid params, returns an error" do
      response = User.build("Street", "User", "test@test.com", 1_234_566, 22)

      expected_response = {:error, "Invalid Parameters"}

      assert response == expected_response
    end
  end
end
