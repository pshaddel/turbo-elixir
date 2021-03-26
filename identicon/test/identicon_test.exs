defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon

  test "hash_input should return the same list each time we call it" do
    assert Identicon.hash_input("str") == Identicon.hash_input("str")
  end

  test "hash_input should return different list when we call different strings" do
    refute Identicon.hash_input("str") == Identicon.hash_input("str1")
  end

end
