defmodule Mealcon.MealTest do
  use Mealcon.DataCase, async: true

  import Mealcon.Factory

  alias Ecto.Changeset

  alias Mealcon.Meal

  describe "changeset/1" do
    test "should create a changeset when all params are valid" do
      params = build(:meal_params)

      response = Meal.changeset(params)

      assert %Changeset{changes: %{description: "A beautiful meal description"}, valid?: true} =
               response
    end

    test "should update a changeset returns the updated changeset" do
      params = build(:meal_params)

      update_params = %{
        description: "A new beautiful meal description"
      }

      response =
        params
        |> Meal.changeset()
        |> Meal.changeset(update_params)

      assert %Changeset{changes: %{description: "A new beautiful meal description"}, valid?: true} =
               response
    end

    test "should not create changeset when params are invalid" do
      params = %{calories: 200, date: "2021-04-04 19:00"}

      response = Meal.changeset(params)

      expected_response = %{
        description: ["can't be blank"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
