# AED III — Conta Bancária

Trabalho de **Algoritmos e Estruturas de Dados III** (Engenharia de Computação,
PUC Minas, 2022/1).

Um sistema de contas bancárias com **menu interativo no terminal**, em que os registros
são gravados em um arquivo. O trabalho reúne, em um só programa, as três técnicas pedidas
na disciplina:

| Arquivo | Papel |
| --- | --- |
| `App.java` | Menu interativo e ponto de entrada do programa |
| `CRUD.java` | CRUD genérico sobre registros de tamanho fixo, com índice por chave |
| `conta_bancaria.java` | Modelo da conta: campos, chaves e ordenação |
| `Registro.java` | Contrato dos registros gravados no arquivo |
| `AES.java` | Criptografia **AES** dos dados gravados |
| `lzw.java` | Compressão **LZW** para reduzir o arquivo |

O programa tem dois perfis de acesso: cliente e administrador.

## Como compilar e executar

Requer o **JDK** instalado (`java` e `javac` no PATH). Rode de dentro desta pasta:

```bash
javac -d bin *.java
java -cp bin conta_bancaria.App
```

O arquivo de dados é criado e mantido na pasta em que o programa é executado.

## Contexto

Exercício acadêmico, com finalidade didática. O CRUD, a criptografia e a compressão
foram implementados do zero, sem bibliotecas de terceiros além da biblioteca padrão do
Java.
