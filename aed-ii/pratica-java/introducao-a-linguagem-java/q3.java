import java.util.Scanner;

public class q3 {
    public static void main(String[] args) throws Exception {

        Scanner console = new Scanner(System.in);
    
        System.out.println("Informe a velocidade do primeiro veiculo: ");
        int v1 = console.nextInt();
        System.out.println("Informe a velocidade do Segundo veiculo: ");
        int v2 = console.nextInt();
        System.out.println("Informe a velocidade do terceiro veiculo: ");
        int v3 = console.nextInt();
        System.out.println("Informe a velocidade do quarto veiculo: ");
        int v4 = console.nextInt();
        System.out.println("Informe a velocidade do quinto veiculo:");
        int v5 = console.nextInt();
        int cont = 0;
        int multa=150;
        int soma = 0;

        if (v1 > 60) {
            soma=soma+multa;
            cont++;
        }
        if (v2 > 60) {
            soma=soma+multa;
            cont++;
        }
        if (v3 > 60) {
            soma=soma+multa;
            cont++;
        }
        if (v4 > 60) {
            soma=soma+multa;
            cont++;
        }
        if (v5 > 60) {
            soma=soma+multa;
            cont++;
        }
        System.out.println("numeros de veiculos acima da velocidade sao de: "+ cont);
        System.out.println("valor da multa eh: "+ soma);
        console.close();
    }
}
