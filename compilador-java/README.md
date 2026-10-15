# Compilador (linguagem didática → MIPS)

Trabalho prático da disciplina de **Compiladores** (Engenharia de Computação, PUC Minas,
2025/2).

Um compilador para uma linguagem didática, com as etapas clássicas de compilação:

| Pasta | Função |
| --- | --- |
| `src/lexer/` | Analisador léxico (`Lexer.java`) e definição dos tokens (`Token.java`) |
| `src/parser/` | Analisador sintático descendente (`Parser.java`) |
| `src/TabelaDeSimbolos/` | Escopos e tabela de símbolos |
| `src/Tipo_de_dados/` | Sistema de tipos (`TipoDado.java`) |
| `src/codegen/` | Geração de código assembly **MIPS** (`CodeGenMIPS.java`) |
| `src/main/` | Ponto de entrada (`Main.java`) |

A linguagem de entrada usa a extensão `.cf` — veja `exemplo.cf`. O programa lê esse
arquivo e escreve o assembly MIPS gerado em `saida.asm`.

## Como compilar e executar

```bash
# a partir da raiz deste projeto
javac -d bin $(find src -name "*.java")
java -cp bin main.Main exemplo.cf
```

O resultado é gravado em `saida.asm`.

O relatório completo do trabalho está em `relatorio.pdf`.
