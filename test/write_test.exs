defmodule WriteTest do
  use ExUnit.Case
  doctest RomanNumbers

  test "writes single numbers" do
    assert RomanNumbers.write(1) == "I"
    assert RomanNumbers.write(5) == "V"
    assert RomanNumbers.write(10) == "X"
    assert RomanNumbers.write(50) == "L"
    assert RomanNumbers.write(100) == "C"
    assert RomanNumbers.write(500) == "D"
    assert RomanNumbers.write(1000) == "M"
  end

  test "writes composite numbers" do
    assert RomanNumbers.write(6) == "VI"
    assert RomanNumbers.write(57) == "LVII"
  end

  test "writes numbers with carry" do
    assert RomanNumbers.write(4) == "IV"
    assert RomanNumbers.write(49) == "XLIX"
  end
end
