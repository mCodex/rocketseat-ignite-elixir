defmodule Exflight.Bookings.BookingTest do
  use ExUnit.Case

  alias Exflight.Bookings.Booking

  import Exflight.Factory

  describe "build/4" do
    setup do
      booking_id = "19f233e8-b40e-4acc-8b3b-3e676240e0fc"
      user_id = "af5488d1-b807-463a-9102-370c1427056a"

      {:ok, date} = NaiveDateTime.from_iso8601("2021-05-20T23:00:00")

      {:ok, booking_id: booking_id, date: date, user_id: user_id}
    end

    test "should build an user if all params are valid", %{
      booking_id: booking_id,
      date: date,
      user_id: user_id
    } do
      response = Booking.build(booking_id, date, "São Paulo", "Florianópolis", user_id)

      expected_response = {:ok, build(:booking, id: booking_id, id_usuario: user_id)}

      assert response == expected_response
    end
  end
end
