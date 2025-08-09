// Desenha uma linha vertical a partir de (x=50, y=100) com altura R0
// R0 = altura
// R1 = contador
// R2 = x
// R3 = y

    @R0
    D=M         // D = n (altura)
    @R1
    M=D         // counter = n

    @50
    D=A
    @R2
    M=D         // x = 50

    @100
    D=A
    @R3
    M=D         // y = 100

(LOOP)
    @R1
    D=M         // D = counter
    @END        
    D;JEQ       // Se counter == 0, sai do loop
    
    // Calcula endereço: SCREEN + y
    @R3
    D=M         // D = y
    @SCREEN
    D=D+A       // D = SCREEN + y
    
    // Soma x: (SCREEN + y) + x
    @R2
    D=D+M       // D = SCREEN + y + x
    A=D
    M=-1        // Desenha um ponto
    
    // y = y + 1
    @R3
    M=M+1
    
    // counter = counter - 1
    @R1
    M=M-1

    @LOOP
    0;JMP

(END)
    @END
    0;JMP
