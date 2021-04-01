defmodule Mealcon do
  alias Mealcon.Meals.Create, as: MealCreate

  defdelegate create_meal(params), to: MealCreate, as: :call
end
