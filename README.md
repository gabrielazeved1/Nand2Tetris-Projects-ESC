# O Caminho do Nand ao Tetris: Projetos de Elementos de Sistemas Computacionais

Este repositório documenta a jornada de construção de um sistema computacional completo, partindo dos princípios mais básicos da lógica digital até a criação de um software capaz de ser executado neste hardware. Os projetos seguem a metodologia do curso **"Nand to Tetris"**, cobrindo as seguintes etapas:

## Projetos

### Projeto 1: Portas Lógicas e Lógica Combinacional
A construção de portas lógicas elementares (AND, OR, NOT) a partir da porta universal NAND. Este projeto estabelece a base de todo o hardware, demonstrando como operações complexas podem ser construídas a partir de componentes simples.

### Projeto 2: Aritmética Booleana
O desenvolvimento da Unidade Lógica e Aritmética (ALU). A partir das portas lógicas do Projeto 1, foram construídos somadores e incrementadores de 16 bits, que são a espinha dorsal de qualquer processador.

### Projeto 3: Memória e Registradores
A criação de componentes de memória sequencial, como flip-flops, registradores de 16 bits e módulos de RAM de diferentes tamanhos. Este projeto introduziu o conceito de estado, permitindo que o computador armazenasse informações.

### Projeto 4: Linguagem Assembly Hack
A introdução à linguagem de máquina Hack, a linguagem de baixo nível para a nossa arquitetura. Foram desenvolvidos programas em Assembly para realizar operações como multiplicação, divisão e cálculo do máximo entre números.

### Projeto 5: Desenvolvimento da CPU e Testes
A integração dos componentes dos projetos 2 e 3 (ALU, registradores e memória) em uma Unidade Central de Processamento (CPU). Este projeto representa o ápice da parte de hardware, culminando na criação de uma CPU capaz de buscar e executar programas.

### Projeto 6: Montador (Assembler)
O desenvolvimento de um montador em Python que traduz código escrito na linguagem Assembly Hack (.asm) para o código de máquina binário (.hack). Este software é a ponte entre a programação simbólica (humana) e a execução direta no hardware que construímos.

---

## A Relação entre os Projetos

Cada projeto é um alicerce para o próximo, formando uma pilha de abstração. O conhecimento do projeto anterior é fundamental para a conclusão do seguinte:

- **Fundamentos Lógicos:** As portas lógicas do Projeto 1 são os blocos de construção para a aritmética do Projeto 2 e para os elementos de memória do Projeto 3.
- **Hardware Essencial:** A ALU (Projeto 2) e os registradores (Projeto 3) se unem para formar o coração do computador, a CPU (Projeto 5).
- **Software e Hardware:** A linguagem Assembly Hack (Projeto 4) é o software que a nossa CPU é capaz de entender. O Montador (Projeto 6) é a ferramenta que nos permite escrever esses programas de forma mais legível, traduzindo-os para o formato binário que a CPU executa.

---

## Conclusão

A execução e validação de cada um desses projetos demonstra uma compreensão completa de como um computador é construído, desde a física fundamental das portas lógicas até a lógica abstrata dos programas.  

Ao longo deste processo, o entendimento do fluxo de dados e das instruções em um sistema computacional foi solidificado, mostrando a interdependência entre hardware e software.
