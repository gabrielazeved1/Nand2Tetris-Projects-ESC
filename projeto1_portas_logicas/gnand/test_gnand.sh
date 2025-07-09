# --- definições para a porta gnand ---
# nome do arquivo do módulo principal
MODULE_FILE="gnand.v"
# nome do arquivo do testbench
TESTBENCH_FILE="tb_gnand.v"
# nome do executável de simulação a ser criado
SIM_EXECUTABLE="sim_gnand"
# nome do arquivo VCD (Value Change Dump) para o GTKWave
VCD_FILE="gnand.vcd"

echo "--- Testando a porta ${MODULE_FILE%.*} ---"

# 1. limpa arquivos de simulação e VCD antigos 
echo "Removendo arquivos antigos: ${SIM_EXECUTABLE} e ${VCD_FILE}"
rm -f ${SIM_EXECUTABLE} ${VCD_FILE}

# 2. compila os arquivos Verilog usando Icarus Verilog
echo "Compilando ${MODULE_FILE} e ${TESTBENCH_FILE}..."
iverilog -o ${SIM_EXECUTABLE} ${MODULE_FILE} ${TESTBENCH_FILE}


if [ $? -ne 0 ]; then
    echo "ERRO: Falha na compilação. Verifique a sintaxe Verilog em ${MODULE_FILE} e ${TESTBENCH_FILE}."
    exit 1 
fi
echo "Compilação bem-sucedida."

# 3. executa a simulação usando vvp
echo "Executando a simulação..."
vvp ${SIM_EXECUTABLE}

#verificar se tem erro
if [ ! -f "${VCD_FILE}" ]; then
    echo "ERRO: O arquivo VCD (${VCD_FILE}) não foi gerado. Verifique o seu testbench (\$dumpfile, \$dumpvars, \$finish)."
    exit 1 
fi
echo "Simulação concluída e ${VCD_FILE} gerado."

# 4. abre o arquivo VCD no GTKWave
echo "Abrindo ${VCD_FILE} no GTKWave..."
gtkwave ${VCD_FILE} & 

echo "--- Teste da porta ${MODULE_FILE%.*} concluído. ---"