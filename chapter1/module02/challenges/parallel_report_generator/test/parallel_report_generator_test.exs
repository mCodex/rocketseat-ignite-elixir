defmodule ParallelReportGeneratorTest do
  use ExUnit.Case
  doctest ParallelReportGenerator

  test "greets the world" do
    assert ParallelReportGenerator.hello() == :world
  end
end
