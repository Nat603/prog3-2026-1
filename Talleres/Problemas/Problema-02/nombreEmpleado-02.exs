defmodule EntradaDatosDos do
  @moduledoc """
  Version 2. Módulo con dos funciones que se reutilizan y es para poder ingresar un nombre y que lo devuelva el programa.
  - autor: Natalia Garcia Ortiz
  - fecha: 17/02/26
  - licencia: GNU GPL v3
  """
  def main do
    "Ingrese nombre del empleado: " #Mensaje en consola
    |> Util.ingresar_texto(:texto) # Funcion reutilizable para poder escribir en consola
    |> generar_mensaje() #Funcion que devuelve la informacion
    |> Util.mostrar_mensaje() # Funcion reutilizable para mostrar un mensaje
  end

  defp generar_mensaje(nombre) do # Funcion que genera un mensaje mas la informacion suministrada

    "Bienvenidos #{nombre} a la empresa Once Ltda" # Mensaje
  end
end

EntradaDatosDos.main()
