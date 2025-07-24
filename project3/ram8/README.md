
## Resumo do papel de cada arquivo

- `ram8.v`      : Define a RAM8 usando array simples.
- `tb_ram8.v`   : Aplica estímulos e gera arquivo VCD.
- `Makefile`    : Automatiza compilação e execução.
- `ram8.vcd`    : Arquivo para visualização no GTKWave.

---

# README - RAM8 (RAM com 8 registros de 16 bits) 

Arquivos na pasta:
- ram8.v       : Código da RAM8 simples e funcional.
- tb_ram8.v    : Testbench que simula o ram8.v.
- Makefile     : Script para compilar e executar o testbench.

Como rodar:
1) Entre na pasta:
cd ram8

2) Compile e rode o testbench com:
make

3) Isso gera o arquivo de simulação "ram8.vcd".

4) Abra o GTKWave para visualizar os sinais:
gtkwave ram8.vcd

Resumo:
- ram8.v contém o módulo que será testado.
- tb_ram8.v é o testbench que aplica estímulos e gera saída.
- Makefile automatiza a compilação e execução.
- GTKWave lê o arquivo VCD para mostrar os sinais digitais em forma de ondas.
