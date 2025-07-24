IVERILOG = iverilog
VVP = vvp
VFLAGS = -Wall

COMPONENT = ram8
TESTBENCH = tb_ram8.v
OUT = ram8.out

all: run

compile:
	$(IVERILOG) $(VFLAGS) -o $(OUT) $(TESTBENCH) $(COMPONENT).v

run: compile
	$(VVP) $(OUT)

clean:
	rm -f *.out *.vcd
