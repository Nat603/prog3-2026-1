defmodule SupermarketSemaphore do
  use GenServer

  # API pública
  def start_link(_) do
    GenServer.start_link(__MODULE__, 1, name: __MODULE__) # solo 1 caja
  end

  def entrar_cliente(nombre) do
    GenServer.call(__MODULE__, {:entrar, nombre})
  end

  def salir_cliente(nombre) do
    GenServer.cast(__MODULE__, {:salir, nombre})
  end

  # Callbacks
  def init(num_cajas) do
    {:ok, %{cajas_libres: num_cajas, cliente_actual: nil, cola: []}}
  end
  # Intento de entrar
  def handle_call({:entrar, nombre}, _from, %{cajas_libres: 0, cola: cola} = state) do
    nuevo_estado = %{state | cola: cola ++ [nombre]}
    {:reply, {:espera, nombre}, nuevo_estado}
  end

  def handle_call({:entrar, nombre}, _from, %{cajas_libres: 1} = state) do
    nuevo_estado = %{state | cajas_libres: 0, cliente_actual: nombre}
    {:reply, {:atendido, nombre}, nuevo_estado}
  end

  # Cliente sale
  def handle_cast({:salir, nombre}, %{cola: []} = state) do
    nuevo_estado = %{state | cajas_libres: 1, cliente_actual: nil}
    {:noreply, nuevo_estado}
  end

  def handle_cast({:salir, _nombre}, %{cola: [siguiente | resto]} = state) do
    nuevo_estado = %{state | cliente_actual: siguiente, cola: resto}
    {:noreply, nuevo_estado}
  end
end

{:ok, _pid} = SupermarketSemaphore.start_link(nil)

SupermarketSemaphore.entrar_cliente("Ana")    # {:atendido, "Ana"}
SupermarketSemaphore.entrar_cliente("Luis")   # {:espera, "Luis"}
SupermarketSemaphore.entrar_cliente("Pedro")  # {:espera, "Pedro"}

SupermarketSemaphore.salir_cliente("Ana")     # Luis pasa automáticamente a la caja
SupermarketSemaphore.salir_cliente("Luis")    # Pedro pasa automáticamente a la caja
