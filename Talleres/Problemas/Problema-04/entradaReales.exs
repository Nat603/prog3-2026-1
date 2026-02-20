defmodule EntradaReales do
  @moduledoc """
  Version 1. Modulo que calcula el valor final de un producto aplicando un descuento.
  - autor: Natalia Garcia Ortiz
  - fecha: 19/02/26
  - licencia: GNU GPL v3
  """
  def main do
    valor_producto =
      "Ingrese el valor del producto: "
      |> Util.ingresar(:entero) # Ingresar un entero, es decir el valor inicial del producto

    porcentaje_descuento =
      "Ingrese el porcentaje de descuento: "
      |> Util.ingresar(:real) # Ingresar un real


    valor_descuento = calcular_valor_descuento(valor_producto, porcentaje_descuento) # Calcula el descuesto de un producto
    valor_final = calcular_valor_final(valor_producto, valor_descuento) # Calcula el valor final del producto a partir del descuento y el valor inicial del producto

    generar_mensaje(valor_descuento, valor_final)
    |> Util.mostrar_mensaje() #Muestra mensaje de cual es el descuento y el valor final
  end

  defp calcular_valor_descuento(valor_producto, porcentaje_descuento) do
      valor_producto * porcentaje_descuento # Funcion que calcula el valor del descuento
  end

    defp calcular_valor_final(valor_producto, valor_descuento) do
        valor_producto - valor_descuento #Funcion que calcula el valor final con el descuento
    end

    defp generar_mensaje(valor_descuento, valor_final) do
      valor_descuento = valor_descuento |> Float.round(1) # Monto del descuento
      valor_final = valor_final |> Float.round(1) # Valor final
      "Valor de descuento de $#{valor_descuento} y el valor final $#{valor_final}" # Mensaje final
    end
      end
