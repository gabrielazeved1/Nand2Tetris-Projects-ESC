TARGET=fulladder_tb.out
SRC=fulladder.v tb_fulladder.v
VCD=fulladder.vcd

all:
	iverilog -o $(TARGET) $(SRC)
	vvp $(TARGET)

wave:
	gtkwave $(VCD)

clean:
	rm -f $(TARGET) $(VCD)
