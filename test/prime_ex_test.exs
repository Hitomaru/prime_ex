defmodule PrimeExTest do
  use ExUnit.Case
  doctest PrimeEx

  test "greets the world" do
    assert PrimeEx.hello() == :world
  end
end
