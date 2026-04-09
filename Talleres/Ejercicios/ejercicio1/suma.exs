defmodule Sumar do
  matriz= [
    [1,2,3],
    [4,5,6],
    [7,8,9]
  ]
   def sumar(matriz), do: sumar(matriz, 0)

   defp sumar([], acumulado), do: acumulado

    defp sumar([fila | resto], acumulado) do
    suma_fila = sumar_fila(fila, 0)
    sumar(resto, acumulado + suma_fila)
  end

  defp sumar([fila | resto], acumulado) do
    suma_fila = sumar_fila(fila, 0)
    sumar(resto, acumulado + suma_fila)
  end

  IO.puts("La suma total es: #{Matriz.sumar(matriz)}")
end
