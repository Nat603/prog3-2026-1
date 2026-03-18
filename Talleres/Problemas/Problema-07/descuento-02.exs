defmodule Descuento do
  def main do
    nombre_cliente= "Ingrese el nombre del cliente:"
        |> Util.ingresar(:texto)

    antiguedad="Ingrese en numeros los años de antiguedad:"
        |> Util.ingresar(:entero)
    end

    def calcular_descuento(antiguedad) do
    case antiguedad do
      x when x < 1 -> 0
      x when x < 3 -> 5
      x when x < 5 -> 10
      _ -> 15
    end
  end
end
