# Projeto 5: Desenvolvimento da CPU e Testes

Este projeto tem como objetivo principal a implementação e validação da **Unidade Central de Processamento (CPU)** da arquitetura Hack em Verilog.  
Integrando componentes lógicos e aritméticos desenvolvidos em projetos anteriores, a CPU é a base para a execução de programas em linguagem de máquina Hack.

---

## Temas Abordados e a Importância dos Projetos Anteriores

A construção da CPU neste projeto é o ponto culminante dos conceitos aprendidos anteriormente, unindo o hardware de baixo nível com o software.

- **Projeto 2 (Aritmética Booleana):**  
  A implementação da ALU neste projeto depende diretamente dos conhecimentos de aritmética booleana.  
  A ALU é o componente central da CPU, responsável por realizar todas as operações de cálculo e lógica.  
  Sem a capacidade de somar, subtrair ou realizar operações bit a bit, a CPU não seria funcional.

- **Projeto 3 (Memória e Registradores):**  
  A CPU utiliza registradores, como o `regA`, `regD` e o `pc`, para armazenar dados temporários e controlar o fluxo do programa.  
  O projeto 3 focou na construção desses componentes de memória (registradores e RAM), que são os blocos de construção essenciais para o funcionamento da CPU neste projeto.

---

## Estrutura do Projeto

- **cpu.v:** Implementa a lógica da CPU, incluindo a interconexão da ALU, registradores (A e D) e o contador de programa (PC).  
- **alu.v:** Implementa a Unidade Lógica e Aritmética (ALU).  
- **tb_cpu.v:** Testbench utilizado para simular a CPU, gerar sinais de clock e reset e carregar um programa de teste na memória de instruções.  
- **Makefile:** Automatiza a compilação (`iverilog`), a simulação (`vvp`) e a visualização das formas de onda (`gtkwave`).  
- **README.md:** Documento de descrição do projeto.

---

## Observações a partir da análise dos sinais

- **Sinal de Reset:**  
  No início da simulação, o sinal de reset está ativo (`1`), o que faz com que os registradores (`regA` e `regD`) e o contador de programa (`pc`) sejam zerados, preparando o sistema para iniciar a execução do programa.  
  Após alguns ciclos, o reset é desativado (`0`), permitindo que a CPU comece a operar normalmente.

- **Contador de Programa (pc):**  
  O `pc` começa no endereço `0` e avança sequencialmente (`0000`, `0001`, `0002`, `0003`...), indicando que a CPU está a buscar as instruções na ordem correta, uma por ciclo de clock.

- **Registrador A (regA):**  
  O valor do `regA` muda de acordo com as instruções **A** que são lidas.  
  Por exemplo, a imagem mostra que o `regA` assume os valores `3039` e `5BA0` em momentos específicos, o que corresponde às instruções `@12345` e `@23456`, respetivamente.  
  Isso valida o processamento correto das instruções **A** pela CPU.

- **Sinais de Controle:**  
  Sinais como `loadA`, `loadD` e `loadM` ativam e desativam de acordo com a instrução atual.  
  Exemplo: quando uma instrução **A** é carregada (indicada pelo bit `instruction[15] = 0`), o sinal `loadA` é ativado, garantindo que o valor da instrução seja carregado no `regA`.  
  A ativação correta destes sinais é fundamental para o fluxo de dados da CPU.

## Conclusão

A análise do GTKWave demonstra que a implementação da CPU está a funcionar como esperado.  
Os testes executados no testbench (`tb_cpu.v`) mostram que a CPU é capaz de:

- Carregar instruções  
- Atualizar registradores  
- Realizar operações da ALU  
- Controlar o fluxo do programa  

