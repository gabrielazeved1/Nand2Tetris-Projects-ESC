IVERILOG = iverilog
VVP = vvp
VFLAGS = -Wall

COMPONENT = dff
TESTBENCH = tb_dff.v
OUT = dff.out

all: run

compile:
	$(IVERILOG) $(VFLAGS) -o $(OUT) $(TESTBENCH) $(COMPONENT).v

run: compile
	$(VVP) $(OUT)

clean:
	rm -f *.out
