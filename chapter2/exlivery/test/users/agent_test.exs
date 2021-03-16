defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    test "when the user is found, returns the user" do
      UserAgent.start_link(%{})

      :user
      |> build(cpf: "12345678")
      |> UserAgent.save()

      response = UserAgent.get("12345678")

      expected_response =
        {:ok,
         %User{address: "Street", age: 22, cpf: "12345678", email: "test@test.com", name: "User"}}

      assert response == expected_response
    end

    test "when the user is found, returns an error" do
      UserAgent.start_link(%{})

      response = UserAgent.get("123")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
