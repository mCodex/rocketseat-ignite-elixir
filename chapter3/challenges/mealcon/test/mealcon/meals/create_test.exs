defmodule Mealcon.Meals.CreateTest do
  use Mealcon.DataCase, async: true

  import Mealcon.Factory

  alias Mealcon.{Error, Meal}
  alias Mealcon.Meals.Create

  describe "call/1" do
    test "should create a meal when all params are valid" do
      params = build(:meal_params)

      response = Create.call(params)

      assert {:ok, %Meal{description: "A beautiful meal description"}} = response
    end

    test "should not create a meal when there are invalid params" do
      params = %{
        date: "2021-04-02 19:00",
        calories: 200
      }

      response = Create.call(params)

      expected_response = %{
        description: ["can't be blank"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = response

      assert errors_on(changeset) == expected_response
    end
  end
end
