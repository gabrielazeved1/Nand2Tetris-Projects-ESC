IVERILOG = iverilog
VVP = vvp
VFLAGS = -Wall

COMPONENT = ram4k
TESTBENCH = tb_ram4k.v
OUT = ram4k.out

all: run

compile:
	$(IVERILOG) $(VFLAGS) -o $(OUT) $(TESTBENCH) $(COMPONENT).v

run: compile
	$(VVP) $(OUT)

clean:
	rm -f *.out *.vcd
