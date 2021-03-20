defmodule Exflight.Users.AgentTest do
  use ExUnit.Case

  import Exflight.Factory

  alias Exflight.Users.Agent, as: UserAgent
  alias Exflight.Users.User

  describe "save/1" do
    setup do
      UserAgent.start_link(%{})

      user_id = "13c2cc5e-78d5-419d-ae6d-1986c7d45428"

      {:ok, user_id: user_id}
    end

    test "should save an user", %{user_id: user_id} do
      user = build(:user, id: user_id)

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      user_id = "13c2cc5e-78d5-419d-ae6d-1986c7d45428"

      user_built = build(:user, id: user_id)

      user = UserAgent.save(user_built)

      {:ok, user: user, user_id: user_id}
    end

    test "should get an user if given user_id is correct", %{user_id: user_id} do
      response = UserAgent.get(user_id)

      expected_response =
        {:ok,
         %User{
           cpf: "123456",
           email: "john_doe@test.com",
           id: "13c2cc5e-78d5-419d-ae6d-1986c7d45428",
           name: "John Doe"
         }}

      assert response == expected_response
    end

    test "should return an error if given id is not found" do
      wrong_id = UUID.uuid4()

      response = UserAgent.get(wrong_id)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
