defmodule Exflight.Users.CreateOrUpdateTest do
  use ExUnit.Case

  import Exflight.Factory

  alias Exflight.Users.Agent, as: UserAgent
  alias Exflight.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "should be able to save an user if params are valid" do
      user = build(:user)

      response = CreateOrUpdate.call(user)

      assert {:ok, _uuid} = response
    end

    test "should throw an error if invalid params are given" do
      user = %{
        id: UUID.uuid4(),
        name: "John Doe",
        email: "john_doe@test.com",
        cpf: 123_456
      }

      response = CreateOrUpdate.call(user)

      assert {:error, _reason} = response
    end
  end
end
