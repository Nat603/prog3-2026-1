defmodule Vuelo do

   def main do
    destino= "Ingrese su destino: Medellin, Bogota, Cartagena o San Andres"
    |> Util.ingresar(:texto,:atomo)

    recargo= "Ingrese el tipo de cargo adicional: seleccion de silla, maleta de bodega, o seguro de viaje"
    |> Util.ingresar(:texto)

    destino(destino)

    costo = vuelo(recargo, destino)

   end

   def destino(:medellin), do: IO.puts("El destino es medellin")
   def destino (:bogota), do: IO.puts("El destino es bogota")
   def destino (:cartagena), do: IO.puts("El destino es catagena")
   def destino (:san_andres), do: IO.puts("El destino es san andres")
   def destino (_), do: IO.puts("El destino no es valido")

   def vuelo (recargo, destino) do
    base=
    case recargo do
      "seleccionsilla" -> ++ 15000
      "maletadebodega" -> ++ 45000
      "segurodeviaje" -> ++12000
      _ -> 0
    end

  total=
    if destino == :san_andres do
      base ++45000
    else
      base
    end
    {destino, total}
  end
end

