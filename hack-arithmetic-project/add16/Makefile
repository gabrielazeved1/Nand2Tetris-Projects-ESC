TARGET=add16_tb.out
SRC=add16.v tb_add16.v
VCD=add16.vcd

all:
	iverilog -o $(TARGET) $(SRC)
	vvp $(TARGET)

wave:
	gtkwave $(VCD)

clean:
	rm -f $(TARGET) $(VCD)
