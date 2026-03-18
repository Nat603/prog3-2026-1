defmodule Util do
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

  def ingresar(mensaje,:texto,:atomo) do
      IO.gets(mensaje)
      |> String.trim()
      |> String.downcase()
      |> String.to_atom() #Obtiene el mensaje y le quita los espacios
      end

  def ingresar(mensaje,:texto) do
    IO.gets(mensaje)
    |> String.trim()
  end
end
