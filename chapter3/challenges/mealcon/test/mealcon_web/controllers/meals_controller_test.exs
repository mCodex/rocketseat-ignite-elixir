defmodule MealconWeb.MealsControllerTest do
  use MealconWeb.ConnCase, async: true

  import Mealcon.Factory

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

  describe "show/2" do
    test "should show a meal when given id exists", %{conn: conn} do
      insert(:meal)

      id = "fe4aa134-d788-4ba4-b251-f557289d6618"

      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> json_response(:ok)

      expected_response = %{
        "meal" => %{
          "calories" => 200,
          "date" => "2021-04-02T19:00:00Z",
          "description" => "A beautiful meal description",
          "id" => "fe4aa134-d788-4ba4-b251-f557289d6618"
        }
      }

      assert response == expected_response
    end
  end

  describe "update/2" do
    test "should update a meal when given id exists", %{conn: conn} do
      insert(:meal)

      id = "fe4aa134-d788-4ba4-b251-f557289d6618"

      params = %{
        description: "Updated Description"
      }

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id, params))
        |> json_response(:ok)

      expected_response = %{
        "meal" => %{
          "description" => "Updated Description",
          "date" => "2021-04-02T19:00:00Z",
          "calories" => 200,
          "id" => "fe4aa134-d788-4ba4-b251-f557289d6618"
        }
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "should delete a meal when given id exists", %{conn: conn} do
      insert(:meal)

      id = "fe4aa134-d788-4ba4-b251-f557289d6618"

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
