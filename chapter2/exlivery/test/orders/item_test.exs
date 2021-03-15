defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "when all params are valid, returns an item" do
      response = Item.build("Pizza", :pizza, 45.5, 1)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an invalid category, returns an error" do
      response = Item.build("Pizza", :invalid_category, 45.5, 1)

      expected_response = {:error, "Invalid Parameters"}

      assert response == expected_response
    end

    test "when there is an invalid price, returns an error" do
      response = Item.build("Pizza", :pizza, "invalid_price", 1)

      expected_response = {:error, "Invalid Price"}

      assert response == expected_response
    end

    test "when there is an invalid quantity, returns an error" do
      response = Item.build("Pizza", :pizza, "invalid_price", -1)

      expected_response = {:error, "Invalid Parameters"}

      assert response == expected_response
    end
  end
end
