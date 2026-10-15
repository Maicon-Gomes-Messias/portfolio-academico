# Portfólio acadêmico — Maicon Gomes Messias

[![Licença: MIT](https://img.shields.io/badge/Licen%C3%A7a-MIT-0F5C55?style=flat-square)](LICENSE)
[![Java](https://img.shields.io/badge/Java-0F5C55?style=flat-square&logo=openjdk&logoColor=white)](compilador-java)
[![Node.js](https://img.shields.io/badge/Node.js-0F5C55?style=flat-square&logo=nodedotjs&logoColor=white)](api-rest-node)
[![Flutter](https://img.shields.io/badge/Flutter-0F5C55?style=flat-square&logo=flutter&logoColor=white)](app-flutter)
[![VHDL](https://img.shields.io/badge/VHDL-0F5C55?style=flat-square)](fpga-vhdl)
[![SQL](https://img.shields.io/badge/SQL-0F5C55?style=flat-square)](banco-de-dados-sql)
[![Python](https://img.shields.io/badge/Python-0F5C55?style=flat-square&logo=python&logoColor=white)](inteligencia-artificial)

[![Site](https://img.shields.io/badge/site-maicon--gomes--messias.github.io-C97A20?style=flat-square)](https://maicon-gomes-messias.github.io/)

Trabalhos de programação que desenvolvi ao longo do **Bacharelado em Engenharia de
Computação (PUC Minas)**, reunidos a partir das submissões da plataforma Canvas.

A ideia aqui não é guardar tudo o que foi entregue na faculdade, e sim **isolar o
código que eu escrevi** — separando-o do material das disciplinas (listas, provas,
PDFs de professores) e dos dados pessoais (notas e feedback no Canvas).

> Contexto acadêmico: são exercícios e trabalhos de disciplinas, com finalidade
> didática. Alguns foram feitos em grupo; quando for o caso, o crédito é compartilhado
> com os colegas de equipe.

## Projetos

| Projeto | Disciplina | Tecnologias | O que é |
| --- | --- | --- | --- |
| [`compilador-java`](compilador-java) | Compiladores (2025/2) | Java | Analisador léxico, sintático, tabela de símbolos e gerador de código **MIPS** |
| [`grafos-java`](grafos-java) | Algoritmos em Grafos (2023/1) | Java | Implementação de estrutura de grafos com leitura de arquivos de teste |
| [`api-rest-node`](api-rest-node) | Redes de Computadores I (2023/1) | Node.js, Express, Knex | API REST com autenticação **JWT**, hash **bcrypt**, **Helmet** e controle de requisições |
| [`fpga-vhdl`](fpga-vhdl) | Sistemas Reconfiguráveis (2022/2) | VHDL, Quartus | Processador em **FPGA**: ULA, registradores, RAM e ROM descritos em VHDL |
| [`app-flutter`](app-flutter) | Lab. de Desenvolvimento para Dispositivos Móveis (2022/1) | Flutter, Dart, Firebase | Aplicativo **MyGarden** (gestão de jardim) com autenticação e Firestore |
| [`banco-de-dados-sql`](banco-de-dados-sql) | Bancos de Dados (2021/1) | SQL | Modelagem, criação, população e consultas de um banco relacional completo |
| [`inteligencia-artificial`](inteligencia-artificial) | Inteligência Artificial (2023/2) | Python, Jupyter | **Algoritmo genético** implementado do zero |
| [`processamento-imagens`](processamento-imagens) | Processamento e Análise de Imagens (2024/2) | Python | Rotinas de processamento digital de imagens |
| [`sistemas-dinamicos-matlab`](sistemas-dinamicos-matlab) | Sistemas Dinâmicos e Controle (2024) | MATLAB | Scripts de modelagem e análise de sistemas de controle |
| [`aed-ii`](aed-ii) | Algoritmos e Estruturas de Dados II (2020/2 e 2021/1) | Java | Práticas em Java e trabalhos teóricos da disciplina |

## Sobre cada projeto

### compilador-java

Compilador para uma linguagem didática, com as três etapas clássicas implementadas:

- `lexer/` — analisador léxico e definição dos tokens;
- `parser/` — analisador sintático descendente;
- `TabelaDeSimbolos/` — escopos e tabela de símbolos;
- `codegen/CodeGenMIPS.java` — geração de código assembly **MIPS**;
- `Tipo_de_dados/` — sistema de tipos.

O arquivo `exemplo.cf` é uma entrada de teste e `saida.asm` é o assembly gerado.
O relatório do trabalho está em `relatorio.pdf`.

### grafos-java

Implementação de um grafo em Java (`Grafo.java`) com um `Main.java` que lê grafos de
arquivos-texto e executa as operações. Os arquivos `graph-test-*.txt` são entradas de
teste de tamanhos diferentes.

### api-rest-node

API REST em Node.js/Express organizada em `controllers/`, `models/` e `routes/`.
Inclui autenticação com **JSON Web Token**, senhas com **bcrypt**, cabeçalhos de
segurança com **Helmet** e conexão a banco via **Knex**.

O projeto usa variáveis de ambiente: copie `.env.example` para `.env` e preencha com
seus dados locais. **O `.env` não é versionado** — foi removido justamente por conter
credenciais.

```bash
npm install
cp .env.example .env   # preencha com seus dados
npm start
```

### fpga-vhdl

Processador descrito em **VHDL** para FPGA, aberto no Quartus. Inclui a ULA
(`trabalho_ula.vhd`), banco de registradores (`registradores.vhd`), memória RAM
(`ram_256x8.vhd`) e ROM (`rom_2k_16.tdf`), além dos diagramas de blocos (`.bdf`) e da
simulação de formas de onda.

### app-flutter

Aplicativo **MyGarden**, gerado no FlutterFlow e evoluído no código. Tem autenticação
por e-mail, Google e Apple (`lib/auth/`), persistência em **Firestore**
(`lib/backend/schema/`) e telas de jardim, plantas e tarefas (`lib/*/`).

Os arquivos de configuração do Firebase (`google-services.json`,
`GoogleService-Info.plist`) foram **removidos** por conterem identificadores do projeto.

### banco-de-dados-sql

Projeto completo de banco relacional:

- `CREATE_DATABASE_SCRIPT.sql` — criação das tabelas (DDL);
- `POPULATE_DATABASE_SCRIPT.sql` — carga de dados (DML);
- `CONSULTAS_DATABASE_SCRIPT.sql` — consultas;
- `RELATORIO_Banco_de_Dados.docx` — relatório do trabalho;
- `LISTAS/` — exercícios de SQL.

### inteligencia-artificial

Algoritmo genético implementado do zero, em duas versões: script Python
(`algoritmo_genetico_ex01.py`) e notebook Jupyter (`algoritmo_genetico_ex01.ipynb`).

### processamento-imagens

Rotinas de processamento digital de imagens em Python (`pai2.py`).

### sistemas-dinamicos-matlab

Scripts em MATLAB de modelagem e análise de sistemas dinâmicos e controle.

### aed-ii

Práticas em **Java** feitas em Algoritmos e Estruturas de Dados II: exercícios de
introdução à linguagem e manipulação de vetores e matrizes. Junto vão os **trabalhos
teóricos** da disciplina nos semestres 2020/2 e 2021/1 — recursividade, somatórios,
complexidade, estruturas lineares, árvores e tabelas hash.

Dois trabalhos maiores da mesma disciplina ficaram em repositórios próprios, para não
duplicar arquivos grandes:
[aed-ii-airbnb](https://github.com/Maicon-Gomes-Messias/aed-ii-airbnb) (ordenação sobre
11 MB de dados) e
[aed-ii-exercicios-c](https://github.com/Maicon-Gomes-Messias/aed-ii-exercicios-c)
(exercícios em C).

## Créditos

Parte destes trabalhos foi desenvolvida **em grupo**. Onde há coautoria, ela fica
registrada no próprio projeto:

- **`fpga-vhdl`** — projeto em equipe. A licença original do repositório foi
  preservada em [`fpga-vhdl/LICENSE`](fpga-vhdl/LICENSE) e credita a coautoria.

Alguns projetos foram publicados apenas com o código-fonte, sem os metadados de Git
dos repositórios originais.

### Sobre dados de terceiros

O script [`banco-de-dados-sql/POPULATE_DATABASE_SCRIPT.sql`](banco-de-dados-sql/POPULATE_DATABASE_SCRIPT.sql)
fazia parte de um trabalho em grupo e trazia, nos registros de exemplo, nomes, e-mails
e telefones de colegas de equipe. Esses valores foram **substituídos por dados
fictícios** antes da publicação. **Nenhum dado pessoal de terceiros é publicado aqui.**

Se você é coautor de algum destes trabalhos e prefere que ele seja creditado de outra
forma — ou removido —, é só abrir uma issue ou entrar em contato.

## Licença

Distribuído sob a licença **MIT** — veja [`LICENSE`](LICENSE). Em resumo: você pode
usar, copiar e adaptar livremente, desde que mantidos os créditos.

Como são trabalhos acadêmicos, **alguns tiveram autoria compartilhada** e trazem a
própria licença e atribuição dentro da pasta. É o caso de
[`fpga-vhdl/LICENSE`](fpga-vhdl/LICENSE), que credita a coautoria do projeto em VHDL.
Nesses casos, a licença do projeto prevalece sobre a raiz.

Se algum conteúdo aqui for de sua autoria e você preferir que seja removido ou
creditado de outra forma, é só abrir uma issue ou entrar em contato.
