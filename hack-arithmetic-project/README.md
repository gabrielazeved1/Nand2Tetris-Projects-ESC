# Hack Arithmetic Project (Verilog)

Este projeto implementa os componentes aritméticos propostos no **Capítulo 2** do livro *The Elements of Computing Systems*, utilizando **Verilog** em vez da linguagem HDL original.

## Estrutura de Pastas

Cada componente tem sua própria pasta com:

- O arquivo Verilog principal (`.v`)
- Um testbench (`tb_<nome>.v`)
- Um `Makefile` com alvos `make`, `make wave` e `make clean`
- Os arquivos `.vcd` são gerados automaticamente para visualização no GTKWave

```bash
hack-arithmetic-project/
├── halfadder/
│   ├── halfadder.v
│   ├── tb_halfadder.v
│   └── Makefile
├── fulladder/
│   ├── fulladder.v
│   ├── tb_fulladder.v
│   └── Makefile
├── add16/
│   ├── add16.v
│   ├── tb_add16.v
│   └── Makefile
├── inc16/
│   ├── inc16.v
│   ├── tb_inc16.v
│   └── Makefile
├── alu/
│   ├── alu.v
│   ├── tb_alu.v
│   └── Makefile
└── README.md
```

---

## Como usar

### 1. Instale as ferramentas no macOS

```bash
brew install icarus-verilog gtkwave
```

### 2. Execute os testes de cada módulo

Entre na pasta do módulo e rode:

```bash
make          # compila e executa
make wave     # abre o GTKWave com sinais do .vcd
make clean    # limpa arquivos gerados
```

---

## O que cada módulo faz

### `halfadder/`
- **Função**: Soma dois bits (`a`, `b`) sem carry-in.
- **Saída**: `sum = a XOR b`, `carry = a AND b`
- **Uso**: base para o somador completo.

---

### `fulladder/`
- **Função**: Soma `a + b + cin`
- **Saída**:
  - `sum = a XOR b XOR cin`
  - `cout = (a & b) | (a & cin) | (b & cin)`
- **Uso**: Encadeado no `add16` para somar 16 bits.

---

### `add16/`
- **Função**: Soma dois números de 16 bits (`a[15:0] + b[15:0]`)
- **Implementação**: 16 instâncias de `fulladder`, com carry encadeado (`ripple carry`)
- **Uso**: Soma multi-bit e base para o `inc16` e a `ALU`

---

### `inc16/`
- **Função**: Incrementa `in[15:0]` em 1
- **Implementação**: Usa `add16` somando `in + 1`
- **Exemplo**:
  - Entrada: `0000000000001111`
  - Saída : `0000000000010000`

---

### `alu/` (Hack ALU)
- **Função**: ALU definida no livro (Capítulo 2)
- **Entradas**:
  - `x[15:0]`, `y[15:0]`
  - 6 bits de controle: `zx`, `nx`, `zy`, `ny`, `f`, `no`
- **Saídas**:
  - `out[15:0]`: resultado final
  - `zr`: 1 se `out == 0`
  - `ng`: 1 se `out < 0`
- **Operações possíveis** (exemplos):
  - `zx=1, nx=0, zy=1, ny=0, f=1, no=0` → `0`
  - `zx=0, nx=0, zy=0, ny=0, f=1, no=0` → `x + y`
  - `zx=0, nx=1, zy=0, ny=0, f=0, no=0` → `~x & y`
- **Implementação**: lógica combinacional pura

---

## Como visualizar sinais no GTKWave

Após rodar `make`, use:

```bash
make wave
```

Isso abrirá o `*.vcd` gerado, com os sinais internos do circuito. Você pode adicionar os sinais manualmente no painel lateral ou usar favoritos.

---

## Progresso e extensões futuras

Implementação de:
- [x] halfadder
- [x] fulladder
- [x] add16
- [x] inc16
- [x] alu (Hack ALU)

---

Desenvolvido por Gabriel Azevedo 
