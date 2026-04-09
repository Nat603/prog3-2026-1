defmodule Reversible do
  # Función principal: valida entrada y evalúa si es reversible
  def es_reversible(n) when is_integer(n) and n > 0 do
    invertido = invertir(n, 0)
    suma = n + invertido
    todos_impares?(suma)
  end

  def es_reversible(_), do: false  # entrada inválida

  #Invertir número recursivamente
  defp invertir(0, acc), do: acc
  defp invertir(n, acc) do
    digito = rem(n, 10)
    invertir(div(n, 10), acc * 10 + digito)
  end

  #Verificar si todos los dígitos son impares
  defp todos_impares?(0), do: true
  defp todos_impares?(n) do
    digito = rem(n, 10)
    if rem(digito, 2) == 0 do
      false
    else
      todos_impares?(div(n, 10))
    end
  end
end

IO.puts Reversible.es_reversible(36)   # true
IO.puts Reversible.es_reversible(12)   # false
