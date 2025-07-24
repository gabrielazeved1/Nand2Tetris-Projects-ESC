
## Resumo do papel de cada arquivo

- `ram4k.v`      : Define a RAM4K usando array simples.
- `tb_ram4k.v`   : Aplica estímulos e gera arquivo VCD.
- `Makefile`     : Automatiza compilação e execução.
- `ram4k.vcd`    : Arquivo para visualização no GTKWave.

---

# README - RAM4K (RAM com 4096 registros de 16 bits) 

Arquivos na pasta:
- ram4k.v       : Código da RAM4K simples e funcional.
- tb_ram4k.v    : Testbench que simula o ram4k.v.
- Makefile      : Script para compilar e executar o testbench.

Como rodar:
1) Entre na pasta:
cd ram4k

2) Compile e rode o testbench com:
make

3) Isso gera o arquivo de simulação "ram4k.vcd".

4) Abra o GTKWave para visualizar os sinais:
gtkwave ram4k.vcd

Resumo:
- ram4k.v contém o módulo que será testado.
- tb_ram4k.v é o testbench que aplica estímulos e gera saída.
- Makefile automatiza a compilação e execução.
- GTKWave lê o arquivo VCD para mostrar os sinais digitais em forma de ondas.
