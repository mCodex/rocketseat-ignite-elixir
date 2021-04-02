defmodule Mealcon.Meals.UpdateTest do
  use Mealcon.DataCase, async: true

  import Mealcon.Factory

  alias Mealcon.Meal
  alias Mealcon.Meals.Update

  describe "call/1" do
    test "should update a meal when given id exists" do
      insert(:meal)

      updated_params = %{
        "id" => "fe4aa134-d788-4ba4-b251-f557289d6618",
        "description" => "Updated description"
      }

      response = Update.call(updated_params)

      assert {:ok, %Meal{description: "Updated description"}} = response
    end
  end
end
