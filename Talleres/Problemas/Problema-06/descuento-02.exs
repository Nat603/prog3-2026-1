defmodule Descuento do
        @moduledoc """
  Version 2. Módulo con una funcion que pide numeros enteros para hacer sacal el multiplo de un numero establecido. CON IF
  - autor: Natalia Garcia Ortiz
  - fecha: 17/03/26
  - licencia: GNU GPL v3
  """
  def main do
    cedula="Ingrese el numero de su cedula:"
    |> Util.ingresar(:entero)
  end

    if rem(cedula, 1991) == 0 do
    true
  else
    false
  end
end
