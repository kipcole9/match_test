defmodule MatchtestTest do
  use ExUnit.Case
  doctest Matchtest

  test "greets the world" do
    assert Matchtest.hello() == :world
  end
end
