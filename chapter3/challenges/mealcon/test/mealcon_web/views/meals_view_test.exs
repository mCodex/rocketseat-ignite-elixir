defmodule Mealcon.MealsViewTest do
  use MealconWeb.ConnCase, async: true

  import Phoenix.View
  import Mealcon.Factory

  alias MealconWeb.MealsView

  test "should render create.json" do
    meal = build(:meal)

    response = render(MealsView, "meal.json", meal: meal)

    assert %{
             meal: %Mealcon.Meal{
               calories: 200,
               date: "2021-04-02 19:00",
               description: "A beautiful meal description",
               id: nil,
               inserted_at: nil,
               updated_at: nil
             }
           } = response
  end
end
