defmodule ListFilterTest do
  use ExUnit.Case

  describe "call/1" do
    test "given an array of strings it parses number and returns the odd" do
      list = ["1", "2", "3", "abcd"]

      response = ListFilter.call(list)

      expected_response = [1, 3]

      assert response == expected_response
    end
  end
end
