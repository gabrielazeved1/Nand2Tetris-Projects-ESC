# Montador Hack Assembly para Trabalho de ESC - UFU

Este projeto implementa um montador (assembler) para a linguagem Hack Assembly, conforme especificado na disciplina de Elementos de Sistemas Computacionais (ESC) da Universidade Federal de Uberlândia (UFU).

---
## Objetivo do Trabalho

Criar uma ferramenta capaz de traduzir programas escritos em linguagem assembly Hack para seu código binário equivalente, pronto para ser executado no emulador da CPU Hack.

---
## Funcionalidades Implementadas

- Suporte às instruções **A** e **C** da linguagem Hack.
- Suporte a símbolos pré-definidos, rótulos personalizados e variáveis.
- Conversão de arquivos `.asm` para arquivos `.bin` contendo instruções de 16 bits em formato texto.
- Detecção e relato de erros durante o processo de montagem, como símbolos não reconhecidos e mnemônicos inválidos.
- Modularização clara com componentes responsáveis por parsing, tradução de códigos e gerenciamento de símbolos.

---
## Estrutura de Pastas e Arquivos

```
hack_assembler/
│
├── Makefile
├── src/
│   ├── Assembler.py
│   ├── Code.py
│   ├── Parser.py
│   ├── SymbolTable.py
│   └── ...
│
├── test_programs/
│   ├── Add.asm
│   ├── Max.asm
│   ├── Rect.asm
│   ├── Pong.asm
│   └── ...
└── ...
```

---

## Descrição de Cada Arquivo

### **1. Makefile**
Arquivo para automatizar a montagem dos programas `.asm`:
- Comando `make` → monta todos os arquivos `.asm` da pasta `test_programs`.
- Comando `make clean` → remove os `.hack` gerados.

---

### **2. Pasta `src/` — Código do Assembler**
Contém os módulos Python que implementam o montador.

#### **Assembler.py**
Arquivo principal.  
Funções:
1. **first_pass()** → percorre o código e registra labels na `SymbolTable`.
2. **second_pass()** → traduz cada instrução para binário usando `Parser` e `Code`.
3. Gera o arquivo `.hack` final.

---

#### **Code.py**
Converte os mnemônicos (`comp`, `dest`, `jump`) para seu equivalente binário de 16 bits.  
- Exemplo: `"D+1"` → `"0011111"` (código de `comp`).

---

#### **Parser.py**
Responsável por:
- Ler o arquivo `.asm`.
- Ignorar comentários e espaços em branco.
- Identificar se a instrução é:
  - **A-instruction** (`@value`)
  - **C-instruction** (`dest=comp;jump`)
  - **Label** (`(LABEL)`)

---

#### **SymbolTable.py**
Gerencia os símbolos e endereços de memória:
- Pré-carrega símbolos do Hack (`R0` a `R15`, `SCREEN`, `KBD`).
- Armazena labels e variáveis encontradas no código.

---

### **3. Pasta `test_programs/` — Programas de Teste**
Contém arquivos `.asm` de exemplo para validar o Assembler.

- **Add.asm** → Soma dois números e armazena o resultado.
- **Max.asm** → Compara dois números e armazena o maior.
- **Rect.asm** → Desenha um retângulo/linha vertical na tela usando `R0` como altura.
- **Pong.asm** → Jogo simples de Pong (versão em Assembly Hack).

Cada `.asm` é convertido em um `.hack` equivalente, pronto para ser executado no **CPU Emulator**.

---

## Funcionamento Geral

1. **Entrada**: arquivo `.asm` escrito na linguagem Assembly Hack.
2. **Passo 1 (First Pass)**:
   - O parser lê linha por linha.
   - Labels são adicionados na `SymbolTable` com seu endereço.
3. **Passo 2 (Second Pass)**:
   - Cada instrução é traduzida para binário (16 bits).
   - O binário é salvo no arquivo `.hack`.
4. **Saída**: arquivo `.hack` executável no CPU Emulator.

---

## Como Executar

```bash
make       # Monta todos os arquivos .asm
make clean # Remove todos os .hack gerados
```
* Para montar um arquivo específico manualmente:*
```
python3 src/Assembler.py caminho/para/arquivo.asm
```



---
## Tratamento de Erros

- Arquivos não encontrados são reportados com mensagem clara.

- Mnemônicos inválidos geram exceção com linha e descrição do erro.

- Símbolos não definidos são tratados e adicionados automaticamente como variáveis a partir do endereço 16.

- Comentários e linhas vazias são ignorados corretamente.

##  Como Testar no CPU Emulator

1. Abra o **CPU Emulator** do nand2tetris.
2. Vá em **File → Load Program** e selecione um `.hack` gerado.
3. Clique em **Run** ou **Single Step** para ver a execução.
4. Se for gráfico, vá em **View → Screen** para visualizar a saída.

---

##  Resumo do Fluxo

```
.asm (Assembly Hack)
   ↓ Parser
   ↓ SymbolTable (labels e variáveis)
   ↓ Code (conversão para binário)
   ↓ Assembler (gera arquivo final)
.bin (binário executável)
```

---

##  Referências
- [nand2tetris](https://www.nand2tetris.org/)
- [Especificação da linguagem Hack](https://www.nand2tetris.org/project04)
