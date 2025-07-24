
## Resumo do papel de cada arquivo

- `register.v`      : Define o comportamento do registrador de 16 bits.
- `tb_register.v`   : Aplica estímulos e gera o arquivo VCD para visualização.
- `Makefile`        : Automatiza compilação e execução da simulação.
- `register.vcd`    : Arquivo gerado da simulação para visualizar com GTKWave.

---

# README - REGISTER (Registrador de 16 bits) [texto puro]

Arquivos na pasta:
- register.v : Código do registrador de 16 bits.
- tb_register.v : Testbench que simula o register.v.
- Makefile : Script para compilar e executar o testbench.

Como rodar:
1) Entre na pasta:
cd register

2) Compile e rode o testbench com:
make

3) Isso gera o arquivo de simulação "register.vcd".

4) Abra o GTKWave para visualizar os sinais:
gtkwave register.vcd

Resumo:
- register.v contém o módulo que será testado.
- tb_register.v é o testbench que aplica estímulos e gera saída.
- Makefile automatiza a compilação e execução.
- GTKWave lê o arquivo VCD para mostrar os sinais digitais em forma de ondas.
