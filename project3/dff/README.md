
## Resumo do papel de cada arquivo

- `dff.v`      : Define o comportamento do Flip-Flop tipo D.
- `tb_dff.v`   : Aplica estímulos e gera o arquivo VCD para visualização.
- `Makefile`   : Automatiza compilação e execução da simulação.
- `dff.vcd`    : Arquivo gerado da simulação para visualizar com GTKWave.

---

# README - DFF (Flip-Flop tipo D) 

Arquivos na pasta:
- dff.v       : Código do Flip-Flop D.
- tb_dff.v    : Testbench que simula o dff.v.
- Makefile    : Script para compilar e executar o testbench.

Como rodar:
1) Entre na pasta:
cd dff

2) Compile e rode o testbench com:
make

3) Isso gera o arquivo de simulação "dff.vcd".

4) Abra o GTKWave para visualizar os sinais:
gtkwave dff.vcd

Resumo:
- dff.v contém o módulo que será testado.
- tb_dff.v é o testbench que aplica estímulos e gera saída.
- Makefile automatiza a compilação e execução.
- GTKWave lê o arquivo VCD para mostrar os sinais digitais em forma de ondas.
