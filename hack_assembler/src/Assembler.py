import sys
import os
from Parser import Parser
from Code import Code
from SymbolTable import SymbolTable

class Assembler:
    # orquestra o processo de montagem da linguagem Hack Assembly para o binário bin.
    def __init__(self, input_file):
        if not os.path.exists(input_file):
            raise FileNotFoundError(f"Erro: ficheiro de origem não encontrado: {input_file}")
        
        self.input_file = input_file
        self.output_file = input_file.replace('.asm', '.bin')
        self.symbol_table = SymbolTable()

    def first_pass(self):
        parser = Parser(self.input_file)
        rom_address = 0
        while parser.has_more_commands():
            parser.advance()
            command_type = parser.command_type()
            
            if command_type == 'L_COMMAND':
                label = parser.symbol()
                self.symbol_table.add_entry(label, rom_address)
            elif command_type in ['A_COMMAND', 'C_COMMAND']:
                rom_address += 1
    
    def second_pass(self):
        parser = Parser(self.input_file)
        with open(self.output_file, 'w') as out_f:
            ram_address = 16
            while parser.has_more_commands():
                parser.advance()
                command_type = parser.command_type()

                if command_type == 'A_COMMAND':
                    symbol = parser.symbol()
                    if symbol.isdigit():
                        value = int(symbol)
                    elif self.symbol_table.contains(symbol):
                        value = self.symbol_table.get_address(symbol)
                    else:
                        self.symbol_table.add_entry(symbol, ram_address)
                        value = ram_address
                        ram_address += 1
                    
                    binary_code = '0' + format(value, '015b')
                    out_f.write(binary_code + '\n')
                
                elif command_type == 'C_COMMAND':
                    comp = parser.comp()
                    dest = parser.dest()
                    jmp = parser.jmp()

                    try:
                        comp_bin = Code.comp(comp)
                        dest_bin = Code.dest(dest)
                        jmp_bin = Code.jmp(jmp)
                    except ValueError as e:
                        raise ValueError(f"Erro na linha {parser.current_line_index+1}: {e}")

                    binary_code = '111' + comp_bin + dest_bin + jmp_bin
                    out_f.write(binary_code + '\n')
# comentarios para ficar mais facil testar... depois preciso apagar
    def assemble(self):
        print(f"Iniciando a montagem do ficheiro: {self.input_file}")
        try:
            self.first_pass()
            self.second_pass()
            print(f"Sucesso! Montagem concluída. Ficheiro de saída: {self.output_file}")
        except Exception as e:
            print(f"Erro durante a montagem: {e}")
            raise

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Uso: python Assembler.py <ficheiro.asm>")
        sys.exit(1)
    
    input_file_path = sys.argv[1]
    
    try:
        assembler = Assembler(input_file_path)
        assembler.assemble()
    except FileNotFoundError as e:
        print(e)
