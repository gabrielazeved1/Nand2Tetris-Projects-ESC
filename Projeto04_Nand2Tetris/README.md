# Tarefa 04 - Programas em Assembly para a Arquitetura Hack

Este trabalho faz parte da disciplina **Elementos de Sistemas Computacionais (ESC)** e consiste em implementar quatro programas básicos em linguagem assembly para a arquitetura Hack (projeto do curso Nand2Tetris). Como a ALU do Hack não possui instruções nativas para multiplicação, divisão ou cálculo de média, as operações são implementadas por meio de somas e subtrações repetidas, além de comparações condicionais.

---

## Descrição dos Arquivos

### 1. `MultiROM.asm`

- **Objetivo:** Multiplicar os valores armazenados em `R1` e `R2`.
- **Como funciona:** 
  - Inicializa `R0` com 0, que armazenará o resultado.
  - Usa o valor de `R1` como contador.
  - Soma o valor de `R2` repetidamente `R1` vezes.
  - Armazena o produto final em `R0`.
- **Observação:** O valor de `R1` é decrementado até zero durante o processo.

---

### 2. `DivisionROM.asm`

- **Objetivo:** Dividir o valor em `R1` pelo valor em `R2`, armazenando o quociente em `R0`.
- **Como funciona:**
  - Inicializa `R0` com 0, que armazenará o quociente.
  - Realiza subtrações repetidas de `R2` de `R1`.
  - Incrementa `R0` a cada subtração válida.
  - Para quando o resultado da subtração fica negativo (não é possível subtrair mais).
- **Observação:** Há uma verificação para evitar divisão por zero, que encerra o programa caso `R2` seja zero.

---

### 3. `GreaterThanROM.asm`

- **Objetivo:** Encontrar o maior valor entre os armazenados em `R1`, `R2` e `R3`.
- **Como funciona:**
  - Compara `R1` e `R2` para determinar o maior entre eles.
  - Compara esse maior com `R3`.
  - Armazena o maior valor encontrado em `R0`.

---

### 4. `MeanROM.asm`

- **Objetivo:** Calcular a média dos valores armazenados na memória RAM a partir do endereço em `R1`, somando `R2` valores.
- **Como funciona:**
  - Inicializa a soma em `R0`.
  - Usa `R1` como ponteiro para os endereços da memória RAM.
  - Soma `R2` valores consecutivos começando do endereço em `R1`.
  - Calcula a média dividindo a soma pelo número de valores (`R2`) por meio de subtrações repetidas (já que não há divisão nativa).
  - Armazena a média final em `R0`.
- **Observação:** Reutiliza a lógica de divisão baseada em subtrações do `DivisionROM.asm`.

---

## Como testar os programas

- Os programas devem ser montados e simulados no ambiente do curso Nand2Tetris.
- Pode-se utilizar o Web IDE oficial: [https://nand2tetris.github.io/web-ide/asm/](https://nand2tetris.github.io/web-ide/asm/)
- Para cada programa:
  - Cole o código no editor "Source Code".
  - Clique em "Assemble".
  - Clique em "Simulate" para abrir o CPU Emulator.
  - Configure os valores de entrada nos registradores `R1`, `R2`, `R3` ou na memória RAM (para a média).
  - Execute o programa e verifique o resultado em `R0`.

---

## Estrutura dos arquivos para entrega

```properties
Tarefa04/
├── MultiROM.asm # Multiplicação
├── DivisionROM.asm # Divisão
├── GreaterThanROM.asm # Máximo entre três valores
├── MeanROM.asm # Cálculo da média
README.md # Este arquivo de descrição
```

---

## Considerações finais

Este trabalho reforça a compreensão da arquitetura Hack e a habilidade de programar em assembly, manipulando instruções simples para construir operações complexas. Além disso, desenvolve o raciocínio lógico para implementar algoritmos básicos sem instruções nativas específicas.

---

*Gabriel — Engenharia de Computação*  
