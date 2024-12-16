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

  def parse str do
    l = to_list(str)
    check_decreasing(l)
    check_max_repetitions(l)
    Enum.sum(l)
  end

  def to_list("") do [] end
  def to_list(str) do
    is_sub = Enum.member?(Map.values(@d2r_sub), String.slice(str, 0..1))
    {el, str} = String.split_at(str, (if is_sub do 2 else 1 end))
    if not Enum.member?(Map.keys(@r2d), el) do
      raise "invalid character"
    end
    [@r2d[el]] ++ to_list(str)
  end

  def check_decreasing(l) do
    if Enum.sort(l, &(&1 > &2)) != l do
      raise "values increase"
    end
  end

  def check_max_repetitions(list) do
    check_max_repetitions(list, 1001, 0)
  end
  def check_max_repetitions([], _, _) do end
  def check_max_repetitions([el | list], last, rep) do
    if last == el do
      is_base = Enum.member?(Map.keys(@d2r_base), el)
      check_max_repetitions(list, el, rep + 1)
      if not is_base do
        raise "help or subtractive value repeated"
      end
      if rep >= 2 do
        raise "repeated more than three times"
      end
    else
      check_max_repetitions(list, el, 0)
    end
  end
end
