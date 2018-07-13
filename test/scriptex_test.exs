defmodule ScriptexTest do
  use ExUnit.Case
  doctest Scriptex

  test "greets the world" do
    assert Scriptex.hello() == :world
  end
end
