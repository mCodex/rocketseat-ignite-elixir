defmodule MealconWeb.MealsView do
  use MealconWeb, :view

  alias Mealcon.Meal

  def render("meal.json", %{meal: %Meal{} = meal}), do: %{meal: meal}
end
