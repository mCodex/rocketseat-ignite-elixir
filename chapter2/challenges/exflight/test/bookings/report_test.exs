defmodule Exflight.Bookings.ReportTest do
  use ExUnit.Case

  import Exflight.Factory

  alias Exflight.Bookings.Agent, as: BookingAgent
  alias Exflight.Bookings.Report

  describe "generate_report/1" do
    setup do
      BookingAgent.start_link(%{})

      booking_id = "19f233e8-b40e-4acc-8b3b-3e676240e0fc"
      user_id = "af5488d1-b807-463a-9102-370c1427056a"

      :booking
      |> build(id: booking_id, id_usuario: user_id)
      |> BookingAgent.save()

      :ok
    end

    test "should create a report by given interval" do
      Report.generate_report("2021-05-20T20:00:00", "2021-05-30T20:00:00", "report_test.csv")

      response = File.read!("report_test.csv")

      expected_response =
        "19f233e8-b40e-4acc-8b3b-3e676240e0fc, af5488d1-b807-463a-9102-370c1427056a, 2021-05-20 23:00:00, São Paulo, Florianópolis\n"

      assert response == expected_response
    end
  end
end
