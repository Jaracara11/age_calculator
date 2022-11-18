defmodule AgeCalculatorTest do
  use ExUnit.Case
  doctest AgeCalculator

  test "greets the world" do
    assert AgeCalculator.hello() == :world
  end
end
