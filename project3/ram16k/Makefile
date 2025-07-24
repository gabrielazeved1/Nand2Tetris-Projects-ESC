IVERILOG = iverilog
VVP = vvp
VFLAGS = -Wall

COMPONENT = ram16k
TESTBENCH = tb_ram16k.v
OUT = ram16k.out

all: run

compile:
	$(IVERILOG) $(VFLAGS) -o $(OUT) $(TESTBENCH) $(COMPONENT).v

run: compile
	$(VVP) $(OUT)

clean:
	rm -f *.out *.vcd
