defmodule Exflight.Bookings.AgentTest do
  use ExUnit.Case

  import Exflight.Factory

  alias Exflight.Bookings.Agent, as: BookingAgent
  alias Exflight.Bookings.Booking

  describe "save/1" do
    setup do
      BookingAgent.start_link(%{})

      :ok
    end

    test "should create a booking with given params" do
      booking = build(:booking)
      response = BookingAgent.save(booking)

      assert {:ok, _uuid} = response
    end
  end

  describe "get/1" do
    setup do
      BookingAgent.start_link(%{})

      id = "19f233e8-b40e-4acc-8b3b-3e676240e0fc"
      user_id = "af5488d1-b807-463a-9102-370c1427056a"

      {:ok, booking_id: id, user_id: user_id}
    end

    test "should get a booking with by its id", %{booking_id: booking_id, user_id: user_id} do
      booking = build(:booking, id: booking_id, id_usuario: user_id)

      BookingAgent.save(booking)

      response = BookingAgent.get(booking_id)

      expected_response =
        {:ok,
         %Booking{
           cidade_destino: "Florianópolis",
           cidade_origem: "São Paulo",
           data_completa: ~N[2021-05-20 23:00:00],
           id: "19f233e8-b40e-4acc-8b3b-3e676240e0fc",
           id_usuario: "af5488d1-b807-463a-9102-370c1427056a"
         }}

      assert response == expected_response
    end

    test "should not get a booking by id if it does not exists", %{
      user_id: user_id
    } do
      booking = build(:booking, id_usuario: user_id)

      BookingAgent.save(booking)

      response = BookingAgent.get("12345")

      expected_response = {:error, "Flight Booking not found"}

      assert response == expected_response
    end
  end
end
