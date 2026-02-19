defmodule EntradaDatos do
  @moduledoc """"
  Version 1. Módulo con una funcion que se reutiliza y es para poder ingresar un nombre y que lo devuelva el programa.
  - autor: Natalia Garcia Ortiz
  - fecha: 17/02/26
  - licencia: GNU GPL v3
  """

  def main do
    "Ingrese nombre del empleado: " #El texto que aparece en consola
    |> ingresar_texto() # Funcion para poder escribir en consola
    |> generar_mensaje() # Funcion que devuelve la informacion
    |> Util.mostrar_mensaje() # Funcion reutilizable para mostrar un mensaje
  end

  defp ingresar_texto(mensaje) do # Funcion que obtiene informacion y quita los espacios antes y despues de la palabra
  mensaje
    |> IO.gets()
    |> String.trim()
  end

  defp generar_mensaje(nombre) do #Funcion que une un mensaje con la informacion suministrada

    "Bienvenido #{nombre} a la empresa Once Ltda"
  end
end

EntradaDatos.main()
