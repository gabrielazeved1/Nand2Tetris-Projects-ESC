
TARGET=alu_tb.out
SRC=alu.v tb_alu.v
VCD=alu.vcd

all:
	iverilog -o $(TARGET) $(SRC)
	vvp $(TARGET)

wave:
	gtkwave $(VCD)

clean:
	rm -f $(TARGET) $(VCD)
