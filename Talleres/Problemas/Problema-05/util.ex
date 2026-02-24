defmodule Util do
    def mostrar_mensaje(mensaje) do
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

    def ingresar(mensaje, :texto) do
      IO.gets(mensaje,:texto)
    end

    def ingresar(mensaje, :boolean) do
      mensaje= if credencial = si
      "El usuario tiene credenciales validas"
    else
      "El usuario no tiene credencioales activas"
