defmodule Mealcon do
  alias Mealcon.Meals.Create, as: MealCreate
  alias Mealcon.Meals.Update, as: MealUpdate

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate update_meal(params), to: MealUpdate, as: :call
end
