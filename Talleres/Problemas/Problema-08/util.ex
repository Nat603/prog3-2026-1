defmodule Util do
  def ingresar(mensaje,:texto) do
        IO.gets(mensaje)
        |> String.trim()#Obtiene el mensaje y le quita los espacios
        |> String.downcase()
        |> String.to_atom()

  end
end
