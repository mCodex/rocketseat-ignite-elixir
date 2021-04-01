defmodule Mealcon.MealTest do
  use Mealcon.DataCase, async: true

  describe "changeset/1" do
    test "should create a new changeset when all params are valid" do
      params = build(:meal)
    end
  end
end
