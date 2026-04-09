defmodule Vocales do
  defmodule ContadorVocales do
    def contar_vocales_graphemes(cadena) do
      cantidad =
        cadena
        |> String.downcase()
        |> String.graphemes()
        |> contar(0)

      IO.puts("La cadena tiene #{cantidad} vocales.")
    end

    defp contar([], vocal), do: vocal
    defp contar([head | tail], vocal) do
      nueva_vocal = if head in ["a", "e", "i", "o", "u"], do: vocal + 1, else: vocal
      contar(tail, nueva_vocal)
    end
  end
end

Vocales.ContadorVocales.contar_vocales_graphemes("Tengo")
