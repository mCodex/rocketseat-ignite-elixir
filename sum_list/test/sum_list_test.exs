defmodule SumListTest do
  use ExUnit.Case

  describe "call/1" do
    test "returns the list's sum" do
      list = [1, 2, 3, 4]

      response = SumList.call(list)
      expected_response = 10

      assert response == expected_response
    end
  end
end
