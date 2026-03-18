defmodule Descuento do
       @moduledoc """
  Version 1. Módulo con una funcion que pide numeros enteros para hacer sacar el multiplo de un numero establecido. CON GUARDAS
  - autor: Natalia Garcia Ortiz
  - fecha: 17/03/26
  - licencia: GNU GPL v3
  """
  def main do
    cedula="Ingrese el numero de su cedula:"
    |> Util.ingresar(:entero)
  end

  def aplica_descuento?(cedula) when rem(cedula, 1991) == 0, do: true
  def aplica_descuento?(_cedula), do: false

end
Descuento.ejecutar()
