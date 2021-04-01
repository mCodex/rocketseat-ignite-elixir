defmodule MealconWeb.FallbackController do
  use MealconWeb, :controller

  alias Mealcon.Error

  alias MealconWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
