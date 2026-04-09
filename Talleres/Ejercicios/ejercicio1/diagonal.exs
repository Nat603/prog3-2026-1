defmodule diagonal do
  matriz= [
    [1,2,3],
    [4,5,6],
    [7,8,9]
  ]
  def recorrer(matriz), do recorrer(matriz,0)

  defp recorrer(matriz,i) when i == length(matriz), do: :ok
  fila = Enum.at(matriz, i)
    elemento = Enum.at(fila, i)
    IO.puts("Elemento en diagonal: #{elemento}")
     recorrer(matriz, i + 1)
  end
end
Diagonal.recorrer(matriz)
