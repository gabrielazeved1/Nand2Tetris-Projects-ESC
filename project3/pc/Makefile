IVERILOG = iverilog
VVP = vvp
VFLAGS = -Wall

COMPONENT = pc
TESTBENCH = tb_pc.v
OUT = pc.out

all: run

compile:
	$(IVERILOG) $(VFLAGS) -o $(OUT) $(TESTBENCH) $(COMPONENT).v

run: compile
	$(VVP) $(OUT)

clean:
	rm -f *.out *.vcd
