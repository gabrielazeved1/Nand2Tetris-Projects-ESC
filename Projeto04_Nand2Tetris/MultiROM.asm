// multiplica R1 por R2 e guarda o resultado em R0

@0
M=0       // começo zerando R0, q vai guardar o resultado final

@1
D=M       // coloco o valor de R1 em D, q será meu contador

@END
D;JEQ     // se R1 for zero, já posso terminar 

(LOOP)
@2
D=M       // carrego R2 em D, q vai ser somado

@ADD
0;JMP     // pulo pra parte que faz a soma

(ADD)
@0
M=M+D     // soma R2 em R0

@1
MD=M-1    // decremento R1 (contador)

@LOOP
D;JGT     // se R1 ainda for maior q 0, volto pro loop

(END)
@END
0;JMP     // termina o programa
