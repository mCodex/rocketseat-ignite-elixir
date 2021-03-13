defmodule ReportGenerator do
  @months %{
    "1" => "janeiro",
    "2" => "fevereiro",
    "3" => "março",
    "4" => "abril",
    "5" => "maio",
    "6" => "junho",
    "7" => "julho",
    "8" => "agosto",
    "9" => "setembro",
    "10" => "outubro",
    "11" => "novembro",
    "12" => "dezembro"
  }

  def call(filename) do
    filename
    |> read_file()
    |> Enum.reduce(initial_acc(), fn line, report ->
      organize_data(line, report)
    end)
  end

  defp organize_data(
         [name, hour, _day, month, year],
         %{
           :all_hours => all_hours,
           :hours_per_month => hours_per_month,
           :hours_per_year => hours_per_year
         }
       ) do
    all_hours = merge_maps(all_hours, %{name => hour})

    hours_per_month = merge_sub(hours_per_month, %{name => %{month => hour}})

    hours_per_year = merge_sub(hours_per_year, %{name => %{year => hour}})

    %{"all_hours" => all_hours, "hours_per_month" => %{}, "hours_per_year" => %{}}

    build_report(all_hours, hours_per_month, hours_per_year)
  end

  defp initial_acc() do
    build_report(%{}, %{}, %{})
  end

  defp merge_sub(map1, map2) do
    Map.merge(map1, map2, fn _k, v1, v2 ->
      merge_maps(v1, v2)
    end)
  end

  defp merge_maps(map1, map2) do
    Map.merge(map1, map2, fn _key, v1, v2 -> v1 + v2 end)
  end

  defp read_file(filename) do
    "report/#{filename}"
    |> File.stream!()
    |> Stream.map(&parse_line/1)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(1, &String.to_integer/1)
    |> List.update_at(2, &String.to_integer/1)
    |> List.update_at(3, &Map.get(@months, &1))
    |> List.update_at(4, &String.to_integer/1)
  end

  defp build_report(all_hours, hours_per_month, hours_per_year) do
    %{
      :all_hours => all_hours,
      :hours_per_month => hours_per_month,
      :hours_per_year => hours_per_year
    }
  end
end
