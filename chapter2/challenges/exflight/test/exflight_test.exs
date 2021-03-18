defmodule ExflightTest do
  use ExUnit.Case
  doctest Exflight

  test "greets the world" do
    assert Exflight.hello() == :world
  end
end
