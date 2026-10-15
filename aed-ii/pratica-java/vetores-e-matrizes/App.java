import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {
        Scanner console = new Scanner(System.in);
        // declaração de variaveis
        int matriz[][] = new int[3][4];
        int maior = matriz[0][0];
        int menor = matriz[0][0];
        int p = 0;
        int q = 0;
        int r = 0;
        int s = 0;
        // entrada de dados da matriz
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 4; j++) {
                System.out.println("informe os valores da matriz");
                matriz[i][j] = console.nextInt();
            }
        }
        // impressao da matriz estruturada
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 4; j++) {
                System.out.print(matriz[i][j] + " ");
            }
            System.out.println();
        }

        // matriz com a condicao pra descobrir o maior e o menor
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 4; j++) {
                // criando uma matriz zerada para alocar o maior e menor valor
                if (i == 0 && j == 0) {
                    menor = matriz[0][0];
                    maior = matriz[0][0];
                }
                // condicao para o menor
                if (matriz[i][j] < menor) {
                    menor = matriz[i][j];
                    p = i;
                    q = j;
                }
                // condicao para o maior
                if (matriz[i][j] > maior) {
                    maior = matriz[i][j];

                    r = i;
                    s = j;
                }
            }
        }
        // printa na tela do usuario o maior e menor valor e sua posicao.
        System.out.println("maior elemento da matriz eh:" + maior + " SUA POSICAO EH: [" + r + "] [" + s + "]");
        System.out.println("menor elemento da matriz eh:" + menor + " SUA POSICAO EH:[" + p + "] [" + q + "]");

        console.close();
    }
}
