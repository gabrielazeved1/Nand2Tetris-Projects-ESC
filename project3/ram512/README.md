
## Resumo do papel de cada arquivo

- `ram512.v`      : Define a RAM512 usando array simples.
- `tb_ram512.v`   : Aplica estímulos e gera arquivo VCD.
- `Makefile`      : Automatiza compilação e execução.
- `ram512.vcd`    : Arquivo para visualização no GTKWave.

---

# README - RAM512 (RAM com 512 registros de 16 bits) [texto puro]

Arquivos na pasta:
- ram512.v       : Código da RAM512 simples e funcional.
- tb_ram512.v    : Testbench que simula o ram512.v.
- Makefile       : Script para compilar e executar o testbench.

Como rodar:
1) Entre na pasta:
cd ram512

2) Compile e rode o testbench com:
make

3) Isso gera o arquivo de simulação "ram512.vcd".

4) Abra o GTKWave para visualizar os sinais:
gtkwave ram512.vcd

Resumo:
- ram512.v contém o módulo que será testado.
- tb_ram512.v é o testbench que aplica estímulos e gera saída.
- Makefile automatiza a compilação e execução.
- GTKWave lê o arquivo VCD para mostrar os sinais digitais em forma de ondas.
