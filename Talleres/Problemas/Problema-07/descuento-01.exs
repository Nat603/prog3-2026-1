defmodule Descuento do
    def main do
        nombre_cliente= "Ingrese el nombre del cliente:"
        |> Util.ingresar(:texto)

        antiguedad="Ingrese en numeros los años de antiguedad:"
        |> Util.ingresar(:entero)
    end

    def antiguedad(antiguedad) do
        cond do
            antiguedad < 1 -> 0
            antiguedad < 3 -> 10
            antiguedad <= 6 -> 14
            antiguedad > 6 -> 17
        end
    end
end
