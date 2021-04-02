defmodule Mealcon do
  alias Mealcon.Meals.Create, as: MealCreate
  alias Mealcon.Meals.Delete, as: MealDelete
  alias Mealcon.Meals.Get, as: MealGet
  alias Mealcon.Meals.Update, as: MealUpdate

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate delete_meal(id), to: MealDelete, as: :call
  defdelegate get_meal_by_id(id), to: MealGet, as: :by_id
  defdelegate update_meal(params), to: MealUpdate, as: :call
end
