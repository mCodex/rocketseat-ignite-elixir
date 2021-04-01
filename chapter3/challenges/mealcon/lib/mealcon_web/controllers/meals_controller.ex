defmodule MealconWeb.MealsController do
  use MealconWeb, :controller

  alias Mealcon.Meal

  alias MealconWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- Mealcon.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("meal.json", meal: meal)
    end
  end
end
