defmodule Mealcon.Meals.Create do
  alias Mealcon.{Meal, Repo}

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
  end
end
