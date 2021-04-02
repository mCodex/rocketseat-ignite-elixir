defmodule Mealcon.Meals.ShowTest do
  use Mealcon.DataCase, async: true

  import Mealcon.Factory

  alias Mealcon.{Error, Meal}
  alias Mealcon.Meals.Get

  describe "by_id/1" do
    test "should show a meal whne given id exists" do
      insert(:meal)

      id = "fe4aa134-d788-4ba4-b251-f557289d6618"

      response = Get.by_id(id)

      assert {:ok, %Meal{description: "A beautiful meal description"}} = response
    end

    test "should show an error when given id not exists" do
      id = "fe4aa134-d788-4ba4-b251-f557289d6618"

      response = Get.by_id(id)

      expected_resonse = {:error, Error.build_meal_not_found_error()}

      assert response == expected_resonse
    end
  end
end
