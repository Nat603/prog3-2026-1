defmodule Descuento do
        @moduledoc """
  Version 2. Módulo con una funcion que pide numeros enteros para hacer sacal el multiplo de un numero establecido. CON COND
  - autor: Natalia Garcia Ortiz
  - fecha: 17/03/26
  - licencia: GNU GPL v3
  """
  def main do
    cedula="Ingrese el numero de su cedula:"
    |> Util.ingresar(:entero)
  end

  def aplica_descuento?(cedula) do
  case rem(cedula, 1991) do
    0 -> true
    _ -> false
  end
end
end
