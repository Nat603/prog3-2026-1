defmodule Vocales do
  def contar_vocales (cadena) do
    def contar_vocales_sin_graphemes(cadena) do
      cantidad = contar(cadena, 0, 0)
            IO.puts("La cadena tiene #{cantidad} vocales.")
          end
          defp contar(cadena, indice, vocal) when indice >= String.length(cadena), do:
          defp contar(cadena, indice, vocal) do
            caracter = String.at(cadena, indice) |> String.downcase()
            nueva_vocal = if caracter in ["a", "e", "i", "o", "u"], do: vocal + 1, else: vocal
            contar(cadena, indice + 1, nueva_vocal)
          end
        end
      end
      Vocales.contar_vocales_sin_graphemes("Tengo hambre")
