import java.util.Scanner;

public class q2 {
    public static void main(String[] args) throws Exception {

        Scanner console = new Scanner(System.in);
        int  ma = 0;
        System.out.println("Informe a primeira nota: ");
        int nota1 = console.nextInt();
        System.out.println("Informe a segunda nota: ");
        int nota2 = console.nextInt();
        System.out.println("Informe a terceira nota: ");
        int nota3 = console.nextInt();
        ma = (nota1 + nota2 + nota3)/3;
        System.out.println("\nMedia Aritmetica: "+ma);
       
        if (ma >= 6 && ma < 10) {

            System.out.println("Aprovado");

        }  else if (ma > 0 && ma < 4) {

            System.out.println("Reprovado");
        } else {
            System.out.println("Exame Especial");
        }
        
        console.close();
    }

}
