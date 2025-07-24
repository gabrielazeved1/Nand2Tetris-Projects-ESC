IVERILOG = iverilog
VVP = vvp
VFLAGS = -Wall

COMPONENT = register
TESTBENCH = tb_register.v
OUT = register.out

all: run

compile:
	$(IVERILOG) $(VFLAGS) -o $(OUT) $(TESTBENCH) $(COMPONENT).v bit/bit.v

run: compile
	$(VVP) $(OUT)

clean:
	rm -f *.out
