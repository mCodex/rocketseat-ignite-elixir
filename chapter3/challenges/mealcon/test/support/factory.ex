defmodule Mealcon.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Mealcon.Meal

  def meal_params_factory do
    %{
      description: "A beautiful meal description",
      date: "2021-04-02 19:00",
      calories: 200
    }
  end

  def meal_factory do
    %Meal{
      description: "A beautiful meal description",
      date: "2021-04-02 19:00",
      calories: 200
    }
  end
end
