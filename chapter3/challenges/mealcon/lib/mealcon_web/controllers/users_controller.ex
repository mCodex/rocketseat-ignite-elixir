defmodule MealconWeb.UsersController do
  use MealconWeb, :controller

  alias Mealcon.User

  alias MealconWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Mealcon.create_user(params) do
      conn
      |> put_status(:created)
      |> render("user.json", user: user)
    end
  end

  # def show(conn, %{"id" => id}) do
  #   with {:ok, %Meal{} = meal} <- Mealcon.get_meal_by_id(id) do
  #     conn
  #     |> put_status(:ok)
  #     |> render("meal.json", meal: meal)
  #   end
  # end

  # def update(conn, params) do
  #   with {:ok, %Meal{} = meal} <- Mealcon.update_meal(params) do
  #     conn
  #     |> put_status(:ok)
  #     |> render("meal.json", meal: meal)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   with {:ok, _result} <- Mealcon.delete_meal(id) do
  #     conn
  #     |> put_status(:no_content)
  #     |> text("")
  #   end
  # end
end
