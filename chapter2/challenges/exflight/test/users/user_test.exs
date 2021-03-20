defmodule Exflight.Users.UserTest do
  use ExUnit.Case

  alias Exflight.Users.Agent, as: UserAgent
  alias Exflight.Users.User

  import Exflight.Factory

  describe "build/4" do
    setup do
      UserAgent.start_link(%{})

      user_id = "13c2cc5e-78d5-419d-ae6d-1986c7d45428"

      {:ok, user_id: user_id}
    end

    test "should build an user if all params are valid", %{user_id: user_id} do
      response = User.build(user_id, "John Doe", "john_doe@test.com", "123456")

      expected_response = {:ok, build(:user, id: user_id)}

      assert response == expected_response
    end

    test "should not build an user if at least one param is invalid", %{user_id: user_id} do
      assert {:error, _reason} = User.build(user_id, "John Doe", "john_doe@test.com", 123_456)
    end
  end
end
