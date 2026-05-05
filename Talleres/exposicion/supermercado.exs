defmodule Supermercado do
  use GenServer

  # ======================
  # API (lo que tú usas)
  # ======================

  def start_link(_) do
    GenServer.start_link(_MODULE, :ok, name: __MODULE_)
  end

  def entrar(nombre) do
    GenServer.call(_MODULE_, {:entrar, nombre})
  end

  def salir(nombre) do
    GenServer.cast(_MODULE_, {:salir, nombre})
  end

  # ======================
  # ESTADO INICIAL
  # ======================

  def init(:ok) do
    {:ok, %{caja: :libre, cliente_actual: nil, cola: []}}
  end

  # ======================
  # ENTRAR A LA CAJA
  # ======================

  # Si la caja está libre
  def handle_call({:entrar, nombre}, _from, %{caja: :libre} = estado) do
    nuevo_estado = %{
      estado
      | caja: :ocupada,
        cliente_actual: nombre
    }

    IO.puts("🟢 #{nombre} pasa a la caja")

    {:reply, :ok, nuevo_estado}
  end

  # Si la caja está ocupada
  def handle_call({:entrar, nombre}, _from, %{caja: :ocupada, cola: cola} = estado) do
    nuevo_estado = %{
      estado
      | cola: cola ++ [nombre]
    }

    IO.puts("🔴 #{nombre} espera en la fila")

    {:reply, :espera, nuevo_estado}
  end

  # ======================
  # SALIR DE LA CAJA
  # ======================

  # Si no hay nadie en la cola
  def handle_cast({:salir, nombre}, %{cola: []} = estado) do
    IO.puts("✅ #{nombre} terminó de pagar")

    nuevo_estado = %{
      estado
      | caja: :libre,
        cliente_actual: nil
    }

    {:noreply, nuevo_estado}
  end

  # Si hay alguien esperando
  def handle_cast({:salir, nombre}, %{cola: [siguiente | resto]} = estado) do
    IO.puts("✅ #{nombre} terminó de pagar")
    IO.puts("➡️ #{siguiente} pasa desde la fila a la caja")

    nuevo_estado = %{
      estado
      | cliente_actual: siguiente,
        cola: resto
    }

    {:noreply, nuevo_estado}
  end
end
