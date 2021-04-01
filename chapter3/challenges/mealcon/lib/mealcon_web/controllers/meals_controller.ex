defmodule MealconWeb.MealsController do
  use MealconWeb, :controller

  alias Mealcon.Meal

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- Mealcon.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("meal.json", meal: meal)
    end
  end
end
