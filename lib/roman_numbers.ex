defmodule RomanNumbers do
  @d2r_base %{1 => "I", 10 => "X", 100 => "C", 1000 => "M"}
  @d2r_help %{5 => "V", 50 => "L", 500 => "D"}
  @d2r_sub %{4 => "IV", 9 => "IX", 40 => "XL", 90 => "XC", 400 => "CD", 900 => "CM"}

  @d2r Map.merge(Map.merge(@d2r_base, @d2r_help), @d2r_sub)
  @r2d Map.new(@d2r, fn {k, v} -> {v, k} end)

  def write 0 do "" end
  def write num do
    els = Enum.reverse(Map.keys(@d2r))
    el = Enum.find(els, &(&1 <= num))
    @d2r[el] <> write(num - el)
  end

  def parse(str) do
    val = parse_i(str)
    if write(val) != str, do: raise "invalid number format"
  end

  defp parse_i(""), do: 0
  defp parse_i(str) do
    is_sub = Enum.member?(Map.values(@d2r_sub), String.slice(str, 0..1))
    {el, str} = String.split_at(str, (if is_sub do 2 else 1 end))
    if not Enum.member?(Map.keys(@r2d), el), do: raise "invalid character"
    @r2d[el] + parse_i(str)
  end
end
