defmodule Descuento do
  def main do
    tipo_bolsa="Ingresar el tipo de bolsa : plastica, biodegradable, o reutilizable"
    |> Util.ingresar(:texto)

    descuento(tipo_bolsa)
  end

  def descuento(tipo_bolsa) do
    case tipo_bolsa do
      "plastica" -> IO.puts " el descuento es del 2%"
      "biodegradable" -> IO.puts "el descuento es del 12%"
      "reutilizable" -> IO.puts "el descuento es del 17%"
      _ -> IO.puts "No hay descuento"
    end
  end
end

