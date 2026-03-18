defmodule Descuento do
  @descuentos %{
    plastica: 2,
    biodegradable: 12,
    reutilizable: 17
  }

  def main do
    tipo_bolsa="Ingresar el tipo de bolsa : plastica, biodegradable, o reutilizable"
    |> Util.ingresar(:texto)

    descuento(tipo_bolsa)
  end

  def descuento(tipo_bolsa) do
    case Map.get(@descuentos, tipo_bolsa) do
      nil -> IO.puts("Tipo de bolsa no válido")
      porcentaje -> IO.puts("El descuento es del #{porcentaje}%")
    end
  end
end
