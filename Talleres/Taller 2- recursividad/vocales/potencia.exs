defmodule Potencia do
  def es_potencia?(n, b) when n <= 0 or b <= 0, do: false
  def es_potencia?(1, _b), do: true
  def es_potencia?(n, b) when n < b, do: false
  def es_potencia?(n, b) when rem(n, b) == 0 do
    es_potencia?(div(n, b), b)
  end
  def es_potencia?(_n, _b), do: false

  # Función para probar
  def probar do
    casos = [
      {16, 2},   # true
      {64, 4},   # true
      {50, 10},  # false
      {1, 5},    # true
      {27, 3},   # true
      {8, 2},    # true
      {9, 2},    # false
      {100, 10}, # true
      {0, 2},    # false
    ]

    IO.puts("=== VERIFICAR POTENCIA ===")
    IO.puts("n\tb\tResultado\tEsperado\tCorrecto")
    IO.puts("----------------------------------------")

    Enum.each(casos, fn {n, b} ->
      resultado = es_potencia?(n, b)
      esperado = case {n, b} do
        {16, 2} -> true
        {64, 4} -> true
        {1, 5} -> true
        {27, 3} -> true
        {8, 2} -> true
        {100, 10} -> true
        _ -> false
      end
      correcto = if resultado == esperado, do: "OK", else: "FAIL"
      IO.puts("#{n}\t#{b}\t#{resultado}\t#{esperado}\t#{correcto}")
    end)
  end
end

# Ejecutar
Potencia.probar()
