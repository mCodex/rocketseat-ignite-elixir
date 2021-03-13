defmodule ParallelReportGenerator.MapMerger do
  def merge(map1, map2) do
    Map.merge(map1, map2, fn _key, v1, v2 -> v1 + v2 end)
  end

  def merge_two_levels(map1, map2) do
    Map.merge(map1, map2, fn _k, v1, v2 ->
      merge(v1, v2)
    end)
  end
end
