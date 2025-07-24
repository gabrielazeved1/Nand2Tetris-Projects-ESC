
## Resumo do papel de cada arquivo

- `ram64.v`      : Define a RAM64 usando array simples.
- `tb_ram64.v`   : Aplica estímulos e gera arquivo VCD.
- `Makefile`     : Automatiza compilação e execução.
- `ram64.vcd`    : Arquivo para visualização no GTKWave.

---

# README - RAM64 (RAM com 64 registros de 16 bits) [texto puro]

Arquivos na pasta:
- ram64.v       : Código da RAM64 simples e funcional.
- tb_ram64.v    : Testbench que simula o ram64.v.
- Makefile      : Script para compilar e executar o testbench.

Como rodar:
1) Entre na pasta:
cd ram64

2) Compile e rode o testbench com:
make

3) Isso gera o arquivo de simulação "ram64.vcd".

4) Abra o GTKWave para visualizar os sinais:
gtkwave ram64.vcd

Resumo:
- ram64.v contém o módulo que será testado.
- tb_ram64.v é o testbench que aplica estímulos e gera saída.
- Makefile automatiza a compilação e execução.
- GTKWave lê o arquivo VCD para mostrar os sinais digitais em forma de ondas.
