IVERILOG = iverilog
VVP = vvp
VFLAGS = -Wall

COMPONENT = bit
TESTBENCH = tb_bit.v
OUT = bit.out

all: run

compile:
	$(IVERILOG) $(VFLAGS) -o $(OUT) $(TESTBENCH) $(COMPONENT).v

run: compile
	$(VVP) $(OUT)

clean:
	rm -f *.out
