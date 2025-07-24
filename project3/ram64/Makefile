IVERILOG = iverilog
VVP = vvp
VFLAGS = -Wall

COMPONENT = ram64
TESTBENCH = tb_ram64.v
OUT = ram64.out

all: run

compile:
	$(IVERILOG) $(VFLAGS) -o $(OUT) $(TESTBENCH) $(COMPONENT).v

run: compile
	$(VVP) $(OUT)

clean:
	rm -f *.out *.vcd
