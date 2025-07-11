TARGET=inc16_tb.out
SRC=inc16.v tb_inc16.v
VCD=inc16.vcd

all:
	iverilog -o $(TARGET) $(SRC)
	vvp $(TARGET)

wave:
	gtkwave $(VCD)

clean:
	rm -f $(TARGET) $(VCD)
