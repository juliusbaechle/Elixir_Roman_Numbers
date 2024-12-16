defmodule RomanNumbersConsole do
  def input_opt() do
    text = "Select \n  (1) roman to decimal \n  (2) decimal to roman \n  (3) exit \n"
    {opt, _} = IO.gets(text) |> Integer.parse
    if opt < 1 or opt > 3, do: input_opt()
    opt
  end

  def input_roman() do
    String.trim(IO.gets("Input roman number: \n"))
  end

  def input_decimal() do
    text = "Input decimal number: \n"
    {dec, _} = IO.gets(text) |> Integer.parse
    if dec <= 0, do: input_decimal()
    dec
  end

  def input_loop() do
    opt = input_opt()

    if opt == 1 do
      try do
        IO.puts(RomanNumbers.parse(input_roman()))
      rescue
        e in RuntimeError -> IO.puts("Error occured: " <> e.message)
      end
    end

    if opt == 2 do
      IO.puts(RomanNumbers.write(input_decimal()))
    end

    if opt != 3 do
      input_loop()
    end
  end
end

RomanNumbersConsole.input_loop()
