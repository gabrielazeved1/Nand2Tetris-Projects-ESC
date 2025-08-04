// pega o maior valor entre R1, R2 e R3 e joga em R0

@1
D=M       // coloco R1 em D

@2
D=D-M     // faço R1 - R2

@R2Greater
D;JLT     // se R1 < R2, então R2 é maior até agora

@1
D=M       // senão, R1 continua sendo o maior

@Continue
0;JMP     // pulo pra comparar com R3

(R2Greater)
@2
D=M       // R2 vira o maior atual

(Continue)
@3
D=D-M     // comparo o maior atual com R3

@R3Greater
D;JLT     // se R3 for maior, já pego ele

@1
D=M
@2
D=D-M
@R1GreaterOrEqual
D;JGE     // se R1 ≥ R2, R1 era o maior

@2
D=M       // senão, R2 era o maior

(R1GreaterOrEqual)
@Result
0;JMP     // pulo pro final com o maior valor em D

(R3Greater)
@3
D=M       // R3 é o mai
