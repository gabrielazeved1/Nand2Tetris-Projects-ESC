(START)
    @R0
    D=M         // D = RAM[0]
    @R1
    D=D-M       // D = R0 - R1
    @R2
    M=D         // A = R2
    @END        
    D;JGT       // se R0 > R1, pula para END
    
    // se R1 >= R0, R1 e o maximo.
    @R1
    D=M         // D = RAM[1]
    @R2
    M=D         // R2 = D
(END)
    @END
    0;JMP