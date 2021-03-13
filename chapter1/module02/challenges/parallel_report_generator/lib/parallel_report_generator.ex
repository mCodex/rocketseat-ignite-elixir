defmodule ParallelReportGenerator do
  alias ParallelReportGenerator.{MapMerger, Parser}

  def generate_parallel(filenames) do
    filenames
    |> Task.async_stream(&generate_from/1)
    |> Enum.reduce(initial_acc(), fn {:ok, result}, report ->
      merge_values(result, report)
    end)
  end

  # def generate_parallel(filenames) when not is_list(filenames),
  #   do: {:error, "Provide a list of strings"}

  defp generate_from(filename) do
    {:ok, result} =
      filename
      |> Parser.parse_file()

    Enum.reduce(result, initial_acc(), fn line, report ->
      organize_data(line, report)
    end)
  end

  defp merge_values(
         %{
           "all_hours" => result_all_hours,
           "hours_per_month" => result_hours_per_month,
           "hours_per_year" => result_hours_per_year
         },
         %{
           "all_hours" => all_hours,
           "hours_per_month" => hours_per_month,
           "hours_per_year" => hours_per_year
         }
       ) do
    updated_all_hours = MapMerger.merge(result_all_hours, all_hours)
    updated_hours_per_month = MapMerger.merge(result_hours_per_month, hours_per_month)
    updated_hours_per_year = MapMerger.merge(result_hours_per_year, hours_per_year)

    build_report(updated_all_hours, updated_hours_per_month, updated_hours_per_year)
  end

  defp organize_data(
         [name, hour, _day, month, year],
         %{
           :all_hours => all_hours,
           :hours_per_month => hours_per_month,
           :hours_per_year => hours_per_year
         }
       ) do
    all_hours = MapMerger.merge(all_hours, %{name => hour})

    hours_per_month = MapMerger.merge_two_levels(hours_per_month, %{name => %{month => hour}})

    hours_per_year = MapMerger.merge_two_levels(hours_per_year, %{name => %{year => hour}})

    %{"all_hours" => all_hours, "hours_per_month" => %{}, "hours_per_year" => %{}}

    build_report(all_hours, hours_per_month, hours_per_year)
  end

  defp initial_acc() do
    build_report(%{}, %{}, %{})
  end

  defp build_report(all_hours, hours_per_month, hours_per_year) do
    %{
      :all_hours => all_hours,
      :hours_per_month => hours_per_month,
      :hours_per_year => hours_per_year
    }
  end
end
