defmodule MealconWeb.MealsControllerTest do
  use MealconWeb.ConnCase, async: true

  describe "create/2" do
    test "should create a meal when all params are valid", %{conn: conn} do
      params = %{
        "description" => "A beautiful meal description",
        "date" => "2021-04-02 19:00",
        "calories" => 200
      }

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "meal" => %{
                 "description" => "A beautiful meal description",
                 "date" => "2021-04-02T19:00:00Z",
                 "calories" => 200,
                 "id" => _id
               }
             } = response
    end

    test "should return an error if params are invalid", %{conn: conn} do
      params = %{
        "date" => "2021-04-02 19:00",
        "calories" => 200
      }

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => %{"description" => ["can't be blank"]}}

      assert expected_response == response
    end
  end
end
