# AED III — Futebol

Trabalho de **Algoritmos e Estruturas de Dados III** (Engenharia de Computação,
PUC Minas, 2022/1).

Um sistema de cadastro de times de futebol com **menu interativo no terminal**, em que
os registros são gravados em um arquivo. É o mesmo motor de CRUD do trabalho de
[conta bancária](../conta-bancaria), aplicado a outro domínio.

| Arquivo | Papel |
| --- | --- |
| `App.java` | Menu interativo e ponto de entrada do programa |
| `CRUD.java` | CRUD genérico sobre registros de tamanho fixo, com índice por chave |
| `futebol.java` | Modelo do registro: campos, chaves e ordenação |
| `Registro.java` | Contrato dos registros gravados no arquivo |

## Como compilar e executar

Requer o **JDK** instalado (`java` e `javac` no PATH). Rode de dentro desta pasta:

```bash
javac -d bin *.java
java -cp bin futebol.App
```

## Contexto

Exercício acadêmico, com finalidade didática. A ideia central é entender como um CRUD
funciona por baixo — acesso a arquivo, registro de tamanho fixo e índice por chave — em
vez de usar um banco de dados pronto.
