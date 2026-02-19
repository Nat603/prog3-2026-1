defmodule EntradaEnteros do
  @moduledoc """
  Version 2. Módulo con dos funciones reautilizables para ingresar el valor total de una compra mas el dinero entregado y la devuelta que se debe de dar
  - autor: Natalia Garcia Ortiz
  - fecha: 19/02/26
  - licencia: GNU GPL v3
  """
  def main do
    valor_total = "Ingrese valor total de la factura: "
    |> Util.ingresar(:entero) # Funcion reutilizable para ingresar enteros con su atomo correspondiente
    valor_entregado = "Ingrese valor entregado para el pago: "
    |> Util.ingresar(:entero)
    calcular_devuelta(valor_entregado, valor_total) # Funcion que calcula la devuelta
    |> generar_mensaje() # Funcion que genera el mensaje
    |> Util.mostrar_mensaje() # Funcion que muestra el mensaje que se genero
  end

  defp calcular_devuelta(valor_pago, valor_total) do # Funcion que tiene una operacion que calcula la devuelta
    valor_pago - valor_total
  end

  defp generar_mensaje(devuelta) do # Generacion del mensaje
    "El valor de devuelta es $ #{devuelta}"
  end
end

EntradaEnteros.main()
