IVERILOG = iverilog
VVP = vvp
VFLAGS = -Wall

COMPONENT = ram512
TESTBENCH = tb_ram512.v
OUT = ram512.out

all: run

compile:
	$(IVERILOG) $(VFLAGS) -o $(OUT) $(TESTBENCH) $(COMPONENT).v

run: compile
	$(VVP) $(OUT)

clean:
	rm -f *.out *.vcd
