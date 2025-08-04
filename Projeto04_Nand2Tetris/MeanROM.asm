// faz a média de R2 valores começando do endereço em R1

@0
M=0       // começo zerando R0 (vai acumular a soma)

@1
D=M       // pego o endereço inicial (R1)

@2
A=M
D=A       // pego a qtde de valores (R2)

@END
D;JEQ     // se não tiver nada pra somar, já finaliza

@2
D=M
@Counter
M=D       // salvo o contador com qtde de valores

@1
D=M
@Address
M=D       // salvo o endereço inicial

(LOOP)
@Address
A=M
D=M       // pego valor da memória

@0
M=M+D     // somo com R0

@Address
M=M+1     // avanço pro próximo endereço

@Counter
MD=M-1    // decremento o contador

@LOOP
D;JGT     // se ainda tem valor, volto pro loop

@0
D=M       // soma total tá em D

@2
A=M
D=A       // coloco divisor (qtde de valores) em D

@END
D;JEQ     // se divisor for 0, finaliza

@Sum
M=D       // salvo soma total

@Div
M=0       // zera quociente (vai ser a média)

(DIV_LOOP)
@2
D=M       // pego divisor

@SUBTRACT
0;JMP     // pulo pra subtrair

(SUBTRACT)
@Sum
MD=M-D    // subtraio divisor da soma

@END_DIV
D;JLT     // se ficou negativo, termina divisão

@Div
M=M+1     // incremento quociente

@DIV_LOOP
0;JMP     // repete divisão

(END_DIV)
@Div
D=M       // coloco média final em D

@0
M=D       // joga resultado em R0

(END)
@END
0;JMP     // fim do programa
