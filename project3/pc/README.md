
## Resumo do papel de cada arquivo

- `pc.v`       : Define o contador de programa com reset, load e incremento.
- `tb_pc.v`    : Aplica estímulos e gera arquivo VCD.
- `Makefile`   : Automatiza compilação e execução.
- `pc.vcd`     : Arquivo para visualização no GTKWave.

---

# README - PC (Contador de Programa de 16 bits) 

Arquivos na pasta:
- pc.v         : Código do contador de programa.
- tb_pc.v      : Testbench que simula o pc.v.
- Makefile     : Script para compilar e executar o testbench.

Como rodar:
1) Entre na pasta:
cd pc

2) Compile e rode o testbench com:
make

3) Isso gera o arquivo de simulação "pc.vcd".

4) Abra o GTKWave para visualizar os sinais:
gtkwave pc.vcd

Resumo:
- pc.v contém o módulo que será testado.
- tb_pc.v é o testbench que aplica estímulos e gera saída.
- Makefile automatiza a compilação e execução.
- GTKWave lê o arquivo VCD para mostrar os sinais digitais em forma de ondas.
