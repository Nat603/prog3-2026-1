defmodule EntradaEnteros do
  @moduledoc """
  Version 1. Módulo con tres funciones reautilizables para ingresar un texto que se convierte en el valor total de una compra mas el dinero entregado y la devuelta que se debe de dar
  - autor: Natalia Garcia Ortiz
  - fecha: 19/02/26
  - licencia: GNU GPL v3
  """
  def main do
    valor_total= "Ingrese el total de la factura: "
    |> Util.ingresar(:entero) # Ingresa el valor de la factura

    valor_entregado = "Ingrese el valor para el pago: "
    |> Util.ingresar(:entero) # Ingresa el valor que dio el cliente

    cacular_devuelta(valor_entregado, valor_total) # Operacion que calcula la devuelta
    |> generar_mensaje() # funcion que genera el mensaje
    |> Util.mostrar_mensaje() # Funcion que une un mensaje predeterminado con el generado
  end

  defp ingresar(mensaje, :entero) do
    mensaje
    |> Util.ingresar(:texto) # Obtiene texto
    |> String.to_integer() # Transforma el texto en enteros
    end

    defp calcular_devuelta(valor_pago, valor_total) do

      # Funcion que calcula la devuelta
      valor_pago - valor_total
    end

    defp generar_mensaje(devuelta) do

      # Funcion que genera el mensage
      "El valor de devuelta es $ #{devuelta}"
    end
end

EntradaEnteros.main()
