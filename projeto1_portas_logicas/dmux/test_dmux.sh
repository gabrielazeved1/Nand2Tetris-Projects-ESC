
MODULE_FILE="dmux.v"
# nome do arquivo do testbench
TESTBENCH_FILE="tb_dmux.v"
# nome do executável de simulação a ser criado
SIM_EXECUTABLE="sim_dmux"
# nome do arquivo VCD (Value Change Dump) para o GTKWave
VCD_FILE="dmux.vcd"

echo "--- testando o módulo ${MODULE_FILE%.*} ---"

# 1. limpa arquivos de simulação e VCD antigos (para garantir um teste limpo)
echo "removendo arquivos antigos: ${SIM_EXECUTABLE} e ${VCD_FILE}"
rm -f ${SIM_EXECUTABLE} ${VCD_FILE}

# 2. compila os arquivos Verilog usando Icarus Verilog
echo "compilando ${MODULE_FILE} e ${TESTBENCH_FILE}..."
iverilog -o ${SIM_EXECUTABLE} ${MODULE_FILE} ${TESTBENCH_FILE}

# verifica se a compilação foi bem-sucedida (código de saída 0 significa sucesso)
if [ $? -ne 0 ]; then
    echo "ERRO: falha na compilação. verifique a sintaxe Verilog em ${MODULE_FILE} e ${TESTBENCH_FILE}."
    exit 1 # sai do script com erro
fi
echo "compilação bem-sucedida."

# 3. executa a simulação usando vvp
echo "executando a simulação..."
vvp ${SIM_EXECUTABLE}

# verifica se o arquivo VCD foi gerado (indicando que a simulação rodou)
if [ ! -f "${VCD_FILE}" ]; then
    echo "ERRO: o arquivo VCD (${VCD_FILE}) não foi gerado. verifique o seu testbench (\$dumpfile, \$dumpvars, \$finish)."
    exit 1 # sai do script com erro
fi
echo "simulação concluída e ${VCD_FILE} gerado."

# 4. abre o arquivo VCD no GTKWave
echo "abrindo ${VCD_FILE} no GTKWave..."
gtkwave ${VCD_FILE} & # o '&' faz com que o GTKWave abra em segundo plano

echo "--- teste do módulo ${MODULE_FILE%.*} concluído. ---"