defmodule ReportGeneratorTest do
  use ExUnit.Case

  describe "generate_from/2" do
    test "should generate report from a given file" do
      filename = "report_test.csv"

      response = ReportGenerator.generate_from(filename)

      expected_response = %{
        all_hours: %{
          "Cleiton" => 30,
          "Daniele" => 25,
          "Danilo" => 7,
          "Diego" => 19,
          "Giuliano" => 14,
          "Jakeliny" => 39,
          "Joseph" => 17,
          "Mayk" => 33,
          "Rafael" => 22,
          "Vinicius" => 8
        },
        hours_per_month: %{
          "Cleiton" => %{
            "abril" => 5,
            "dezembro" => 6,
            "julho" => 7,
            "junho" => 4,
            "outubro" => 8
          },
          "Daniele" => %{"abril" => 7, "dezembro" => 5, "junho" => 5, "maio" => 8},
          "Danilo" => %{"abril" => 1, "fevereiro" => 6},
          "Diego" => %{
            "abril" => 4,
            "agosto" => 4,
            "dezembro" => 1,
            "maio" => 1,
            "março" => 6,
            "setembro" => 3
          },
          "Giuliano" => %{"abril" => 1, "fevereiro" => 9, "maio" => 4},
          "Jakeliny" => %{"dezembro" => 9, "julho" => 8, "março" => 14, "outubro" => 8},
          "Joseph" => %{
            "abril" => 4,
            "dezembro" => 2,
            "março" => 3,
            "novembro" => 5,
            "setembro" => 3
          },
          "Mayk" => %{
            "abril" => 4,
            "dezembro" => 5,
            "julho" => 7,
            "junho" => 3,
            "março" => 3,
            "novembro" => 4,
            "setembro" => 7
          },
          "Rafael" => %{"agosto" => 11, "janeiro" => 4, "julho" => 7},
          "Vinicius" => %{"julho" => 8}
        },
        hours_per_year: %{
          "Cleiton" => %{2016 => 3, 2017 => 5, 2018 => 13, 2020 => 9},
          "Daniele" => %{2016 => 10, 2017 => 3, 2018 => 7, 2020 => 5},
          "Danilo" => %{2018 => 1, 2019 => 6},
          "Diego" => %{2016 => 3, 2017 => 8, 2018 => 7, 2019 => 1},
          "Giuliano" => %{2017 => 3, 2019 => 6, 2020 => 5},
          "Jakeliny" => %{2016 => 16, 2017 => 9, 2019 => 12, 2020 => 2},
          "Joseph" => %{2017 => 3, 2019 => 3, 2020 => 11},
          "Mayk" => %{2016 => 11, 2017 => 8, 2019 => 7, 2020 => 7},
          "Rafael" => %{2017 => 18, 2020 => 4},
          "Vinicius" => %{2020 => 8}
        }
      }

      assert response == expected_response
    end
  end
end
