
## Resumo do papel de cada arquivo

- `ram16k.v`      : Define a RAM16K usando array simples.
- `tb_ram16k.v`   : Aplica estímulos e gera arquivo VCD.
- `Makefile`      : Automatiza compilação e execução.
- `ram16k.vcd`    : Arquivo para visualização no GTKWave.

---

# README - RAM16K (RAM com 16384 registros de 16 bits) 

Arquivos na pasta:
- ram16k.v       : Código da RAM16K simples e funcional.
- tb_ram16k.v    : Testbench que simula o ram16k.v.
- Makefile       : Script para compilar e executar o testbench.

Como rodar:
1) Entre na pasta:
cd ram16k

2) Compile e rode o testbench com:
make

3) Isso gera o arquivo de simulação "ram16k.vcd".

4) Abra o GTKWave para visualizar os sinais:
gtkwave ram16k.vcd

Resumo:
- ram16k.v contém o módulo que será testado.
- tb_ram16k.v é o testbench que aplica estímulos e gera saída.
- Makefile automatiza a compilação e execução.
- GTKWave lê o arquivo VCD para mostrar os sinais digitais em forma de ondas.
