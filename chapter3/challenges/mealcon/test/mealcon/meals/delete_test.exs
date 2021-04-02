defmodule Mealcon.Meals.DeleteTest do
  use Mealcon.DataCase, async: true

  import Mealcon.Factory

  alias Mealcon.Meal
  alias Mealcon.Meals.Delete

  describe "call/1" do
    test "should delete a meal when given id exists" do
      insert(:meal)

      response = Delete.call("fe4aa134-d788-4ba4-b251-f557289d6618")

      assert {:ok, %Meal{description: "A beautiful meal description"}} = response
    end
  end
end
