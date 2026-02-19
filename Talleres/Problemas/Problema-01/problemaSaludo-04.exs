defmodule Mensaje do
   @moduledoc """
  Version 4. Modulo que muestra un mensaje
- autor: Natalia Garcia Ortiz
- fecha: 17/02/26
- licencia: GNU GPL v3
  """
  def main do
    "Bienvenidos a la empresa once Ltda"
    |> Util.mostrar_mensaje()
  end
end

Mensaje.main()
