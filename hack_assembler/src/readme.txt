Montador Hack Assembly

Este projeto consiste no desenvolvimento de um montador para a linguagem Hack Assembly. A sua função é traduzir ficheiros de código fonte (.asm) para código de máquina binário (.hack).

A estrutura do montador é dividida em quatro ficheiros Python, cada um com uma responsabilidade clara e bem definida, trabalhando em conjunto para realizar a montagem de forma eficaz.
Estrutura do Montador e Importância dos Ficheiros
1. Assembler.py

    papel: este é o ficheiro principal e o "cérebro" do montador. ele orquestra todo o processo de tradução.

    o que faz: lê o ficheiro de entrada (.asm), gere o fluxo de trabalho de duas passagens (a primeira para encontrar os rótulos e a segunda para traduzir as instruções) e cria o ficheiro de saída (.hack).

    relação: Assembler.py importa e utiliza as outras três classes (Parser, Code, SymbolTable) para realizar o seu trabalho.

2. Parser.py

    papel: atua como um leitor e intérprete do código assembly.

    o que faz: lê o ficheiro de código-fonte linha a linha, ignora comentários e espaços em branco, e divide cada instrução em seus componentes lógicos (dest, comp, jmp para instruções C, ou o símbolo para instruções A e L).

    relação: Assembler.py cria uma instância de Parser.py para iterar sobre as instruções do ficheiro de entrada.

3. Code.py

    papel: é a biblioteca de tradução do montador.

    o que faz: contém tabelas estáticas (na forma de dicionários) que mapeiam as mnemónicas da linguagem Assembly Hack (como D+A, JGT, M, etc.) para suas representações binárias correspondentes.

    relação: Assembler.py invoca os métodos estáticos de Code.py durante a segunda passagem para traduzir as partes de uma instrução C para binário.

4. SymbolTable.py

    papel: gere a tabela de símbolos do montador.

    o que faz: armazena os símbolos pré-definidos da arquitetura (como SP, LCL, R0...) e os símbolos definidos pelo usuário (rótulos e variáveis), associando cada um a um endereço numérico.

    relação: Assembler.py utiliza esta classe na primeira passagem para registar os endereços dos rótulos e na segunda passagem para resolver e alocar endereços para as variáveis.

Conclusão

A combinação destes quatro ficheiros permite que o montador seja robusto e capaz de lidar com todas as funcionalidades da linguagem Hack Assembly de forma clara e organizada. Cada ficheiro tem um propósito único, o que torna o projeto mais fácil de entender e de manter.