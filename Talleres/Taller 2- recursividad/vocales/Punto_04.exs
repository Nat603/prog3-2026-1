defmodule CadenaMasLarga do

  def main do
    lista = ["sol", "computador", "luz", "universidad"]
    resultado = cadena_mas_larga(lista)

    IO.puts("La cadena más larga es: #{resultado}")
  end

  defp cadena_mas_larga([unica]) do
    unica
  end

  defp cadena_mas_larga([cabeza | cola]) do
    mas_larga_resto = cadena_mas_larga(cola)

    if String.length(cabeza) > String.length(mas_larga_resto) do
      cabeza
    else
      mas_larga_resto
    end
  end

end
CadenaMasLarga.main()
