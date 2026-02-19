defmodule Util do
   @moduledoc """
  Modulo reutilizable con una funcion que muestra un mensaje en consola
- autor: Natalia Garcia Ortiz
- fecha: 17/02/26
- licencia: GNU GPL v3
  """
  def mostrar_mensaje(mensaje) do
    @doc """"
    Funcion que genera una ventana con texto
    """
    System.cmd("java",["-cp", ".", "Mensaje", mensaje])
  end
end
