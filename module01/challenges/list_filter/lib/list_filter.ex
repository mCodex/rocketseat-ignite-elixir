defmodule ListFilter do
  require Integer

  def call(list) do
    numbers = number_filter(list)

    find_odd(numbers)
  end

  defp number_filter(list) do
    Enum.flat_map(list, fn string ->
      case Integer.parse(string) do
        {int, _rest} -> [int]
        :error -> []
      end
    end)
  end

  defp find_odd(list) do
    Enum.filter(list, fn n -> Integer.is_odd(n) end)
  end
end
