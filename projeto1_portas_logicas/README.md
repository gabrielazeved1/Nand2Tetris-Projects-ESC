# Repositório ESC

Este repositório é dedicado às suas aulas diárias e projetos relacionados à disciplina ESC.

## Como Gerenciar Este Repositório Localmente e no GitHub

Siga estes passos para manter seu repositório local sincronizado com o GitHub:

1.  **Navegar para a Pasta do Repositório:**
    Abra seu terminal e navegue até a pasta `ESC` no seu computador.
    ```bash
    cd /Users/gabrielazevedo/projects/src/ESC
    ```

2.  **Verificar o Status das Mudanças:**
    Antes de fazer qualquer coisa, é bom ver o que mudou.
    ```bash
    git status
    ```
    Isso mostrará quais arquivos foram modificados, quais são novos e quais estão prontos para serem commitados.

3.  **Adicionar Arquivos para Commit (Staging):**
    Para incluir suas novas aulas, projetos ou quaisquer outras alterações no próximo commit, você precisa adicioná-las ao "staging area" do Git.
    ```bash
    git add .
    ```
    Este comando adiciona todos os arquivos novos e modificados no diretório atual e subdiretórios.

4.  **Fazer um Commit (Salvar as Mudanças Localmente):**
    Depois de adicionar os arquivos, você pode "commitar" suas mudanças. Um commit é como um ponto de salvamento no histórico do seu projeto.
    ```bash
    git commit -m "Mensagem"
    ```
    **Dica:** Use mensagens de commit claras e concisas que descrevam o que você fez (ex: "Adicionando Aula 01 - Introdução", "Atualizando exercícios de portas lógicas").

5.  **Enviar as Mudanças para o GitHub (Push):**
    Para que suas alterações locais apareçam no seu repositório no GitHub, você precisa enviá-las.
    ```bash
    git push origin main
    ```

6.  **Puxar Mudanças do GitHub (Pull):**
    Se você trabalhar em diferentes computadores ou se outras pessoas colaborarem, você pode precisar puxar as últimas mudanças do GitHub para o seu repositório local.
    ```bash
    git pull origin main
    ```