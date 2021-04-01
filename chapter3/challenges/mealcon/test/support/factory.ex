defmodule Mealcon.Factory do
  use ExMachina

  def meal_params_factory do
    {
      "description": "A beautiful meal description",
      "date": "2021-04-02 19:00",
      "calories": 200
    }
  end
end
