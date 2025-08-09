class Parser:
    # abre o ficheiro de origem e prepara para analise
    def __init__(self, input_file):
        self.lines = []
        try:
            with open(input_file, 'r') as f:
                for line in f.readlines():
                    clean_line = line.split('//')[0].strip()
                    if clean_line:
                        self.lines.append(clean_line)
        except FileNotFoundError:
            raise
        
        self.current_line_index = -1
        self.current_command = None

    # verifica se ainda ha mais comandos
    def has_more_commands(self):
        return self.current_line_index < len(self.lines) - 1

    # le o proximo comando
    def advance(self):
        self.current_line_index += 1
        self.current_command = self.lines[self.current_line_index]

    # determina o tipo do comando
    def command_type(self):
        if self.current_command.startswith('@'):
            return 'A_COMMAND'
        elif self.current_command.startswith('('):
            return 'L_COMMAND'
        else:
            return 'C_COMMAND'

    # retorna o simbolo ou endereco
    def symbol(self):
        if self.command_type() == 'A_COMMAND':
            return self.current_command[1:]
        elif self.command_type() == 'L_COMMAND':
            return self.current_command[1:-1]
        return None

    # retorna a parte de destino
    def dest(self):
        if '=' in self.current_command:
            return self.current_command.split('=')[0]
        return None

    # retorna a parte de computacao
    def comp(self):
        if '=' in self.current_command:
            return self.current_command.split('=')[1].split(';')[0]
        if ';' in self.current_command:
            return self.current_command.split(';')[0]
        return self.current_command

    # retorna a parte de salto
    def jmp(self):
        if ';' in self.current_command:
            return self.current_command.split(';')[1]
        return None
