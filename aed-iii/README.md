# AED III — Algoritmos e Estruturas de Dados III

Trabalhos da disciplina de **Algoritmos e Estruturas de Dados III** (Engenharia de
Computação, PUC Minas, 2022/1). O tema central da disciplina é **arquivos**: como os
dados vivem no disco, como são indexados, comprimidos e criptografados.

| Conteúdo | O que é |
| --- | --- |
| [`conta-bancaria/`](conta-bancaria) | Sistema de contas com CRUD em arquivo, criptografia **AES** e compressão **LZW** |
| [`futebol/`](futebol) | Cadastro de times com CRUD em arquivo e índice por chave |
| [`artigo-compressao-de-dados-lossy-lossless.pdf`](artigo-compressao-de-dados-lossy-lossless.pdf) | Artigo sobre compressão de dados com e sem perda |

## conta-bancaria

Sistema bancário com menu interativo no terminal, gravando os registros em arquivo:

- `CRUD.java` — CRUD genérico sobre registros de tamanho fixo, com índice por chave
- `conta_bancaria.java` — modelo da conta: campos, chaves e ordenação
- `Registro.java` — contrato dos registros gravados
- `AES.java` — criptografia **AES** dos dados
- `lzw.java` — compressão **LZW** para reduzir o arquivo

O programa tem dois perfis de acesso: cliente e administrador.

```bash
cd aed-iii/conta-bancaria
javac -d bin *.java
java -cp bin conta_bancaria.App
```

## futebol

O mesmo motor de CRUD, aplicado a outro domínio e sem a camada de criptografia e
compressão — o objetivo aqui é entender o acesso a arquivo, o registro de tamanho fixo
e o índice por chave.

```bash
cd aed-iii/futebol
javac -d bin *.java
java -cp bin futebol.App
```

## O artigo

Um artigo comparando **compressão com perda (lossy)** e **sem perda (lossless)**:
codificação de Huffman, LZW, e as técnicas usadas em imagens, áudio e vídeo. É o
trabalho escrito da disciplina e está em
[`artigo-compressao-de-dados-lossy-lossless.pdf`](artigo-compressao-de-dados-lossy-lossless.pdf).

## Contexto

Exercícios acadêmicos, com finalidade didática. O CRUD, a criptografia e a compressão
foram implementados do zero, sem bibliotecas de terceiros além da biblioteca padrão do
Java.
