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

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- Mealcon.get_meal_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    end
  end

  def update(conn, params) do
    with {:ok, %Meal{} = meal} <- Mealcon.update_meal(params) do
      conn
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, _result} <- Mealcon.delete_meal(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end
end
