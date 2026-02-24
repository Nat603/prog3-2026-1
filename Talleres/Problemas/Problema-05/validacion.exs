defmodule Validacion do

  def main() do
    nombre_usuario = Util.ingresa("Ingrese el nombre del usuario:", :texto)

    edad_usuario = Util.ingresar("Ingrese la edad:", :entero)


    credencial = Util.ingresar("ingrese si tiene credenciales:", :boolean)

    intentos_fallidos = Util.ingresar("Ingrese el numero de intentos:", :entero)


    validacion = validar usuario(nombre_usuario,edad_usuario, credencial)
  end



  def validar_usuario(nombre_usuario,edad_usuario,credencial,intentos) do

    unless credencial do
      {:error"El usuario #nombre no tiene credenciales"}

  intentos=
