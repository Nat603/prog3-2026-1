defmodule Hotel do
  def main do
  dias= "ingrese el numero de dias(en numeros):"
  |> Util.ingresar(:entero)

  tipoCliente= "Ingrese el tipo de cliente: frecuente, corporativo u ocacional"
  |> Util.ingresar(:texto,:atomo)

  temporada= "Ingrese 1 si es temporada alta, o ingrese dos para temporada baja"
  |> Util.ingresar(:entero)

  end

  def descuento(:frecuente), do: 0.20
  def descuento(:corporativo), do: 0.15
  def descuento(:ocasional), do: 0.0
  def descuento(_), do: 0.0

  def recargo(1), do: 0.25   # temporada alta
  def recargo(2), do: 0.0    # temporada baja
  def recargo(_), do: 0.0    # fallback

  def calcular_reserva(noches, tipo_cliente, temporada) when is_integer(noches) and noches > 0 do
    tarifa = tarifa_base(noches)
    subtotal = tarifa * noches

    valor_descuento = subtotal * descuento(tipo_cliente)
    subtotal_desc = subtotal - valor_descuento

    valor_recargo = subtotal_desc * recargo(temporada)
    total = subtotal_desc + valor_recargo

    {
      tarifa,          # tarifa base por noche
      subtotal,        # subtotal sin descuentos ni recargos
      valor_descuento, # valor del descuento
      valor_recargo,   # valor del recargo
      total            # total final
    }
  end
   def calcular_reserva(_, _, _), do: {:error, "Entradas inválidas"}
end

