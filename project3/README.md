# Projeto Memória e PC - Verilog

## Visão Geral

Este projeto implementa em Verilog os blocos básicos de memória (RAM) e o contador de programa (PC) de um computador simples, seguindo o estilo Nand2Tetris. Cada pasta contém um módulo específico de memória ou o PC, com seu respectivo testbench e Makefile para facilitar compilação e simulação.

---

## Explicação

Imagine a arquitetura básica de um computador simples:

- **Memória Principal (RAM):** onde são armazenadas as instruções e dados que o processador acessa.
- **Contador de Programa (PC):** que mantém o endereço da próxima instrução a ser executada.
- **Outros componentes (não implementados aqui):** como registradores, ALU e unidade de controle, que processam as instruções.

Este projeto foca na implementação e validação dos blocos de memória em diferentes capacidades (8 a 16k registradores) e do PC, que são essenciais para o funcionamento da CPU. Esses módulos formam a base para construir sistemas computacionais completos e são fundamentais para o entendimento de arquitetura de computadores e design digital.

---

## Estrutura das Pastas e Papel de Cada Módulo

- **dff/**      : Flip-flop tipo D (dff.v) - base para armazenamento de bits.
- **bit/**      : Registrador de 1 bit (bit.v) - armazena 1 bit com controle de carga.
- **register/** : Registrador de 16 bits (register.v) - conjunto de 16 bits com controle.
- **ram8/**     : RAM com 8 registradores de 16 bits (ram8.v).
- **ram64/**    : RAM com 64 registradores de 16 bits (ram64.v).
- **ram512/**   : RAM com 512 registradores de 16 bits (ram512.v).
- **ram4k/**    : RAM com 4096 registradores de 16 bits (ram4k.v).
- **ram16k/**   : RAM com 16384 registradores de 16 bits (ram16k.v).
- **pc/**       : Contador de programa de 16 bits com reset, load e incremento (pc.v).

Cada pasta possui:

- O código do módulo Verilog.
- Testbench para simulação do módulo.
- Makefile para compilar e rodar o testbench facilmente.
- Arquivo VCD gerado após a simulação para análise visual.

---

## Como Rodar

1. Acesse a pasta desejada, por exemplo:
```bash
cd nome_pasta
```

2. Compile e rode a simulação com
```bash
make
```

3. Isso gera um arquivo de saída de simulação `.vcd` (exemplo: `ram8.vcd`).

4. Visualize os sinais digitais no tempo usando o GTKWave:
```bash
gtkwave nome_arquivo.vcd
```

---

## Ferramentas Importantes

- **Icarus Verilog (iverilog)**: compilador usado para compilar os arquivos Verilog.
- **VVP**: executor dos arquivos compilados gerados pelo iverilog.
- **GTKWave**: ferramenta gráfica para visualizar os arquivos `.vcd` de simulação. Permite acompanhar as ondas digitais, facilitando a análise do comportamento dos sinais no tempo.

---

## Considerações Finais

Este projeto é funcional para simulação e validação dos blocos básicos de memória e do PC de um computador simples. Ele serve como base para construção de uma CPU completa, possibilitando estudo e experimentação com arquitetura computacional e design digital em Verilog.

---

Gabriel Azevedo  
Estudante de Engenharia de Computação - UFU  
Projeto 3 da disciplina ESC - Nand2Tetris  


