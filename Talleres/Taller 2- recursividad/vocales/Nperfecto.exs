defmodule Perfecto do
  def es_perfecto(n) when n < 2, do: false

  def es_perfecto(n) do
    suma_divisores = sumar_divisores(n, 1, 0)
    suma_divisores == n
  end

  # Recursividad de cola
  defp sumar_divisores(num, divisor, acumulador) when divisor > div(num, 2) do
    acumulador
  end

  defp sumar_divisores(num, divisor, acumulador) do
    nuevo_acum =
      if rem(num, divisor) == 0 do
        acumulador + divisor
      else
        acumulador
      end

    sumar_divisores(num, divisor + 1, nuevo_acum)
  end

  # Versión optimizada (hasta raíz cuadrada)
  @doc """
  Determina si un número es perfecto usando un enfoque optimizado.

  Esta versión es más eficiente para números grandes ya que solo verifica
  divisores hasta la raíz cuadrada del número.

  ## Parámetros
  - n: El número entero a verificar.

  ## Retorno
  - true si el número es perfecto, false en caso contrario.

  ## Ejemplos
      iex> Perfecto.es_perfecto_optimizado(6)
      true
      iex> Perfecto.es_perfecto_optimizado(10)
      false
  """
  def es_perfecto_optimizado(n) when n < 2, do: false

  def es_perfecto_optimizado(n) do
    suma = sumar_divisores_opt(n, 1, 0) - n
    suma == n
  end

  defp sumar_divisores_opt(num, divisor, acumulador) when divisor * divisor > num do
    acumulador
  end

  defp sumar_divisores_opt(num, divisor, acumulador) do
    nuevo_acum =
      if rem(num, divisor) == 0 do
        if divisor == div(num, divisor) do
          acumulador + divisor
        else
          acumulador + divisor + div(num, divisor)
        end
      else
        acumulador
      end

    sumar_divisores_opt(num, divisor + 1, nuevo_acum)
  end

  @doc """
  Ejecuta pruebas para verificar la funcionalidad del módulo.

  Imprime una tabla con números de prueba, su suma de divisores,
  si son considerados perfectos y si el resultado es correcto.
  """
  def probar do
    numeros = [6, 28, 496, 8128, 10, 12, 1, 0]

    IO.puts("=== NÚMEROS PERFECTOS ===")
    IO.puts("Número\tSuma divisores\tPerfecto?\tCorrecto")
    IO.puts("----------------------------------------")

    Enum.each(numeros, fn n ->
      resultado = es_perfecto(n)
      esperado = n in [6, 28, 496, 8128]
      correcto = if resultado == esperado, do: "OK", else: "FAIL"

      # Calcular suma para mostrar
      suma =
        if n >= 2 do
          sumar_divisores(n, 1, 0)
        else
          0
        end

      IO.puts(
        "#{format_number(n)}\t#{format_number(suma)}\t#{format_boolean(resultado)}\t#{correcto}"
      )
    end)
  end

  defp format_number(number) do
    number
    |> Integer.to_string()
    |> String.pad_leading(4, "0")
  end

  defp format_boolean(boolean) do
    if boolean do
      "true"
    else
      "false"
    end
  end
end

# Ejecutar
Perfecto.probar()
