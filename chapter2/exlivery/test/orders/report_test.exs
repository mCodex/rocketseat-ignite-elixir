defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    setup do
      OrderAgent.start_link(%{})

      :ok
    end

    test "creates the report file" do
      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      file_name = "report_from_test.csv"

      Report.create(file_name)

      response = File.read!(file_name)

      expected_response =
        "123456, Street, pizza, 1, 45.5, hamburguer, 2, 20.00, 85.50\n" <>
          "123456, Street, pizza, 1, 45.5, hamburguer, 2, 20.00, 85.50\n" <>
          "123456, Street, pizza, 1, 45.5, hamburguer, 2, 20.00, 85.50\n"

      assert response == expected_response
    end
  end
end
