// divide R1 por R2 usando subtrações, resultado vai em R0

@0
M=0       // começo zerando R0 (vai guardar o quociente)

@1
D=M
@END
D;JEQ     // se R1 for zero, já posso terminar

@2
D=M
@DIV_BY_ZERO
D;JEQ     // se R2 for zero, divisão inválida, pulo pro fim

(LOOP)
@2
D=M       // pego R2 em D pra subtrair

@SUBTRACT
0;JMP     // pulo pra parte da subtração

(SUBTRACT)
@1
MD=M-D    // subtraio R2 de R1 e atualizo R1

@END
D;JLT     // se R1 ficou negativo, acabou

@0
M=M+1     // incremento R0 (cada subtração = +1 no quociente)

@LOOP
0;JMP     // repete o loop

(DIV_BY_ZERO)
@END
0;JMP     // se tiver divisão por zero, só termina

(END)
@END
0;JMP     // fim do programa
