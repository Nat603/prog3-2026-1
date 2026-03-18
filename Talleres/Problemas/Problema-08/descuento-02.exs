defmodule Descuento do
  def main do
    tipo_bolsa="Ingresar el tipo de bolsa : plastica, biodegradable, o reutilizable"
    |> Util.ingresar(:texto, :atomo)

    descuento(tipo_bolsa)
  end

  def descuento(:plastica), do: IO.puts("El descuento es del 2%")
  def descuento(:biodegradable), do: IO.puts("El descuento es del 12%")
  def descuento(:reutilizable), do: IO.puts("El descuento es del 17%")
  def descuento(_), do: IO.puts("Tipo de bolsa no válido")
end
