{:ok, _pid} = SupermarketSemaphore.start_link(nil)

SupermarketSemaphore.entrar_cliente("Ana")    # {:atendido, "Ana"}
SupermarketSemaphore.entrar_cliente("Luis")   # {:espera, "Luis"}
SupermarketSemaphore.entrar_cliente("Pedro")  # {:espera, "Pedro"}

SupermarketSemaphore.salir_cliente("Ana")     # Luis pasa automáticamente a la caja
SupermarketSemaphore.salir_cliente("Luis")    # Pedro pasa automáticamente a la caja
