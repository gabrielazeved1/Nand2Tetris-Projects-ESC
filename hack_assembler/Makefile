ASSEMBLER = ./src/Assembler.py
PYTHON = python3
TESTS = test_programs/Add.asm test_programs/Max.asm test_programs/Rect.asm test_programs/Pong.asm

all: $(TESTS:.asm=.hack)

%.hack: %.asm
	@echo "--- Montando $< ---"
	$(PYTHON) $(ASSEMBLER) $< || exit 1

clean:
	rm -f test_programs/*.hack
