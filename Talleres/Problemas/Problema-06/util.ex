defmodule Util do
     @moduledoc """
  Version 1. Módulo reutilizable con una funcion que pide numeros enteros para hacer operaciones
  - autor: Natalia Garcia Ortiz
  - fecha: 17/03/26
  - licencia: GNU GPL v3
  """
    def ingresar(mensaje, :entero) do
    # Funcion para ingresar enteros con su atomo correspondiente
    try do
      mensaje
      |> ingresar(:texto) # Ingresa un texto
      |> String.to_integer() #cambia el texto a numeros enteros
    rescue #Mostrar un mensaje de error usando stderr y se vuelve a invocar la misma función para solicitar nuevamente el dato.
      ArgumentError -> #Si es invalido el valor manda un mensaje
        "Error, se espera que ingrese un número entero\n"
        |> mostrar_error() #Muestra cual es el error
        mensaje
        |> ingresar(:entero) # Vuelve a pedir el dato
      end
    end
  end
