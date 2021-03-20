defmodule Exflight.Bookings.CreateOrUpdateTest do
  use ExUnit.Case

  import Exflight.Factory

  alias Exflight.Bookings.Agent, as: BookingAgent
  alias Exflight.Users.Agent, as: UserAgent

  alias Exflight.Bookings.CreateOrUpdate

  describe "call/2" do
    setup do
      user_id = "af5488d1-b807-463a-9102-370c1427056a"

      UserAgent.start_link(%{})
      BookingAgent.start_link(%{})

      user = build(:user, id: user_id)

      UserAgent.save(user)

      {:ok, user_id: user_id}
    end

    test "should be able to create a booking ticket if user exists", %{user_id: user_id} do
      booking = %{
        data: "2021-05-30T20:00:00",
        cidade_origem: "São Paulo",
        cidade_destino: "Florianópolis"
      }

      response = CreateOrUpdate.call(user_id, booking)

      assert {:ok, _uuid} = response
    end

    test "should not be able to create a booking if data param is invalid", %{user_id: user_id} do
      booking = %{
        data: "30/05/2021",
        cidade_origem: "São Paulo",
        cidade_destino: "Florianópolis"
      }

      response = CreateOrUpdate.call(user_id, booking)

      expected_response = {:error, "Invalid date"}

      assert response == expected_response
    end

    test "should not be able to create a booking if user does not exist" do
      booking = %{
        data: "30/05/2021",
        cidade_origem: "São Paulo",
        cidade_destino: "Florianópolis"
      }

      response = CreateOrUpdate.call("123456", booking)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
