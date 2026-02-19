defmodule Util do
   @moduledoc """
  Version 2. Módulo reutilizable con dos funciones una que muestra un mensaje en consola y el otro que pide numeros enteros para hacer operaciones
  - autor: Natalia Garcia Ortiz
  - fecha: 19/02/26
  - licencia: GNU GPL v3
  """
  def mostrar_mensaje(mensaje) do # Funcion para mostrar un mensaje
    mensaje
    |> IO.puts()
  end

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

      def mostrar_error(mensaje) do # Funcion que muestra cual es el error con su respectivo mensaje
        IO.puts(:standard_error, mensaje)
      end
    end
