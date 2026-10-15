# AED II — Airbnb

Trabalho de **Algoritmos e Estruturas de Dados II** (Engenharia de Computação,
PUC Minas).

O programa lê uma base de acomodações do Airbnb (**11 MB** de dados reais) e trabalha
sobre esses registros: modelagem dos campos, leitura a partir de arquivo e **comparação
de algoritmos de ordenação**.

## Arquivos

| Arquivo | O que é |
| --- | --- |
| `Acomodacao.java` | Código-fonte: modelo da acomodação e o menu |
| `dados_airbnb.txt` | Base de dados usada como entrada |
| `pub.in` | Entrada de teste |
| `matrícula_*.txt` | Saídas geradas por cada algoritmo de ordenação |

Cada campo do registro vem da base: `roomid`, `hostid`, `roomtype`, país, cidade, bairro,
número de avaliações, satisfação geral, capacidade, quartos, preço e tipo de imóvel.

## Algoritmos de ordenação comparados

Bolha, inserção, seleção, **heapsort**, **quicksort** e **mergesort**. Cada execução grava
o resultado em um arquivo `matrícula_<algoritmo>.txt`, o que permite comparar o
comportamento de cada um sobre a mesma massa de dados.

## Como executar

Requer o **JDK** instalado (`java` e `javac` no PATH). Rode **de dentro desta pasta**,
porque o programa abre o arquivo de dados por caminho relativo:

```bash
cd aed-ii/airbnb
javac Acomodacao.java
java Acomodacao
```

Dois pontos de atenção, caso queira adaptar o código:

- o arquivo `dados_airbnb.txt` é aberto por **caminho relativo**, então o programa
  precisa enxergá-lo na pasta de execução;
- as saídas são gravadas em `/tmp/` (caminho típico de Linux). No Windows, ajuste para
  uma pasta local.

O programa usa `JOptionPane` para exibir mensagens, então exige um ambiente gráfico.

## Contexto

Exercício acadêmico, com finalidade didática. A base de dados está versionada junto ao
código para que o programa seja autocontido.
