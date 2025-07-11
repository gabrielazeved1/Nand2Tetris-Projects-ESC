TARGET=halfadder_tb.out
SRC=halfadder.v tb_halfadder.v
VCD=halfadder.vcd

all:
	iverilog -o $(TARGET) $(SRC)
	vvp $(TARGET)

wave:
	gtkwave $(VCD)

clean:
	rm -f $(TARGET) $(VCD)
