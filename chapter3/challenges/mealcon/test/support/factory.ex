defmodule Mealcon.Factory do
  use ExMachina.Ecto, repo: Mealcon.Repo

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
      id: "fe4aa134-d788-4ba4-b251-f557289d6618",
      description: "A beautiful meal description",
      date: "2021-04-02 19:00",
      calories: 200
    }
  end
end
