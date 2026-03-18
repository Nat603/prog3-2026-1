defmodule Cupon do
  @cupon IO.gets("Ingrese el código del cupón: ")
  |> String.trim()

  def validar_cupon do
    @cupon
    |> reglas()
    |> resultado()
  end

  defp reglas(cupon) do
    []
    |> validar_longitud(cupon)
    |> validar_mayuscula(cupon)
    |> validar_numero(cupon)
    |> validar_espacios(cupon)
  end

  defp validar_longitud(errores, cupon) do
    if String.length(cupon) < 10 do
      errores ++ ["El cupón debe tener al menos 10 caracteres"]
    else
      errores
    end
  end

  defp validar_mayuscula(errores, cupon) do
    if cupon == String.downcase(cupon) do
      errores ++ ["El cupón debe contener al menos una letra mayúscula"]
    else
      errores
    end
  end

  defp validar_numero(errores, cupon) do
    if String.match?(cupon, ~r/\d/) do
      errores
    else
      errores ++ ["El cupón debe contener al menos un número"]
    end
  end

  defp validar_espacios(errores, cupon) do
    if String.contains?(cupon, " ") do
      errores ++ ["El cupón no debe contener espacios"]
    else
      errores
    end
  end

  defp resultado([]), do: {:ok, "Cupón válido"}
  defp resultado(errores), do: {:error, Enum.join(errores, " y ")}
end

# Mostramos el resultado directamente
IO.inspect(Main.validar_cupon())

