defmodule ListLengthTest do
  use ExUnit.Case

  describe "call/1" do
    test "given a list returns the sum" do
      list = [1, 2, 3]

      response = ListLength.call(list)

      expected_response = 6

      assert response == expected_response
    end
  end
end
