defmodule Util do
  @moduledoc """
  Version 1. Modulo con funciones reutilizables para ingresar reales y enteros
  - fecha: 19/02/26
  - licencia: GNU GPL v3
  """
  def ingresar(mensaje, :real) do
  try do
    mensaje
    |> ingresar(:texto)
    # Ingresa el texto
    |>String.to_float()
    # Convierte el texto en reales
  rescue
    ArgumentError ->
      # Si identifica en no es numero real, entonces muestra el siguiente mensaje
      "Error, se espera que ingrese un numero real\n"
      |> mostrar_error()
      # Funcion que muestra el error
      mensaje
      |> ingresar(:real)
      # Pide que ingrese de nuevo el valor
    end

  def ingresar(mensaje, :entero), do: ingresar(mensaje, &String.to_integer/1, :entero)
  # Ingresa un mensaje que lo convierte en un entero

  def ingresar(mensaje, :texto) do
    IO.gets(mensaje) |> String.trim() #Obtiene el mensaje y le quita los espacios
  end

  def mostrar_error(mensaje) do
    IO.puts(mensaje) # Muestra un mensaje de error
  end
end
end
