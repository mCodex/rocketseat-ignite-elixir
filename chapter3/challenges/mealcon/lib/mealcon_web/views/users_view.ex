defmodule MealconWeb.UsersView do
  use MealconWeb, :view

  alias Mealcon.User

  def render("user.json", %{user: %User{} = user}), do: %{user: user}
end
