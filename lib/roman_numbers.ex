defmodule RomanNumbers do
  @d2r %{
    1 => "I", 4 => "IV", 5 => "V", 9 => "IX",
    10 => "X", 40 => "XL", 50 => "L", 90 => "XC",
    100 => "C", 400 => "CD", 500 => "D", 900 => "CM",
    1000 => "M"}
  @r2d Map.new(@d2r, fn {k, v} -> {v, k} end)

  def write (0) do "" end
  def write (num) do
    els = Enum.reverse(Map.keys(@d2r))
    el = Enum.find(els, &(&1 <= num))
    @d2r[el] <> write(num - el)
  end

  def parse ("") do 0 end
  def parse (str) do
    is_sub = Enum.member?(Map.keys(@r2d), String.slice(str, 0..1))
    {el, str} = String.split_at(str, (if is_sub, do: 2, else: 1))
    @r2d[el] + parse(str)
  end
end
