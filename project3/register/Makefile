# Makefile para o módulo register

# Compilador
IVERILOG = iverilog
VVP = vvp
GTKWAVE = gtkwave

# Arquivos
TB = tb_register.v
REGISTER = register.v
BIT = ../bit/bit.v

# Output da simulação
OUT = register.out
VCD = register.vcd

# Regra padrão para compilar e simular
all: compile run view

compile:
	$(IVERILOG) -Wall -o $(OUT) $(TB) $(REGISTER) $(BIT)

run:
	$(VVP) $(OUT)

view:
	$(GTKWAVE) $(VCD)

# Limpar arquivos gerados
clean:
	rm -f $(OUT) $(VCD)

.PHONY: all compile run view clean
