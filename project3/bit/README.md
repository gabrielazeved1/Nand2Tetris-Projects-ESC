
## Resumo do papel de cada arquivo

- `bit.v`      : Define o comportamento do registrador de 1 bit.
- `tb_bit.v`   : Aplica estímulos e gera o arquivo VCD para visualização.
- `Makefile`   : Automatiza compilação e execução da simulação.
- `bit.vcd`    : Arquivo gerado da simulação para visualizar com GTKWave.

---

# README - BIT (Registrador de 1 bit) 

Arquivos na pasta:
- bit.v       : Código do registrador de 1 bit.
- tb_bit.v    : Testbench que simula o bit.v.
- Makefile    : Script para compilar e executar o testbench.

Como rodar:
1) Entre na pasta:
cd bit

2) Compile e rode o testbench com:
make

3) Isso gera o arquivo de simulação "bit.vcd".

4) Abra o GTKWave para visualizar os sinais:
gtkwave bit.vcd

Resumo:
- bit.v contém o módulo que será testado.
- tb_bit.v é o testbench que aplica estímulos e gera saída.
- Makefile automatiza a compilação e execução.
- GTKWave lê o arquivo VCD para mostrar os sinais digitais em forma de ondas.
