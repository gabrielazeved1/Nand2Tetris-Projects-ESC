# Makefile para a CPU
# Define os nomes dos arquivos
MODULES = 
TESTBENCH = tb_cpu.v
SIM_EXECUTABLE = sim_cpu
VCD_FILE = signals.vcd

# Alvo principal: compila, simula e visualiza
all: compile simulate view

# Compila todos os arquivos Verilog em um executavel
compile:
	@echo "--- Compilando arquivos Verilog ---"
	iverilog -o $(SIM_EXECUTABLE) $(MODULES) $(TESTBENCH)
	@echo "Compilacao concluida."

# Executa o simulador e gera o arquivo VCD
simulate:
	@echo "--- Executando simulacao ---"
	vvp $(SIM_EXECUTABLE)
	@echo "Simulacao concluida e arquivo VCD gerado."

# Abre o GTKWave para visualizar as formas de onda
view:
	@echo "--- Abrindo GTKWave ---"
	gtkwave $(VCD_FILE) &

# Limpa os arquivos gerados
clean:
	@echo "--- Limpando arquivos gerados ---"
	rm -f $(SIM_EXECUTABLE) $(VCD_FILE)
	@echo "Limpeza concluida."
