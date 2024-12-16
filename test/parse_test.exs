defmodule ParseTest do
  use ExUnit.Case
  doctest RomanNumbers

  test "parses single numbers" do
    assert RomanNumbers.parse("I") == 1
    assert RomanNumbers.parse("V") == 5
    assert RomanNumbers.parse("X") == 10
    assert RomanNumbers.parse("L") == 50
    assert RomanNumbers.parse("C") == 100
    assert RomanNumbers.parse("D") == 500
    assert RomanNumbers.parse("M") == 1000
  end

  test "parses composite numbers" do
    assert RomanNumbers.parse("VI") == 6
    assert RomanNumbers.parse("LVII") == 57
    assert RomanNumbers.parse("LXXXVII") == 87
  end

  test "parses numbers with carry" do
    assert RomanNumbers.parse("IV") == 4
    assert RomanNumbers.parse("XLIX") == 49
  end

  test "throws when parsing invalid number" do
    assert_raise RuntimeError, fn -> RomanNumbers.parse("Y") end
    assert_raise RuntimeError, fn -> RomanNumbers.parse("ID") end
    assert_raise RuntimeError, fn -> RomanNumbers.parse("IIII") end
    assert_raise RuntimeError, fn -> RomanNumbers.parse("VIIII") end
    assert_raise RuntimeError, fn -> RomanNumbers.parse("IVIV") end
    assert_raise RuntimeError, fn -> RomanNumbers.parse("IIX") end
    assert_raise RuntimeError, fn -> RomanNumbers.parse("VV") end
  end
end
