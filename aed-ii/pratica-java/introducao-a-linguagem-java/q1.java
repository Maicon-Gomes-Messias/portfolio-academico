
import java.util.Scanner;

public class q1 {
    public static void main(String[] args) throws Exception {

        Scanner console = new Scanner(System.in);
        double poc = 0;
        System.out.println("Informe o salário: ");
        int salario = console.nextInt();
        if (1200 <= salario) {
            poc = salario * 0.10;

        } else {
            poc = salario * 0.05;
        }
        System.out.println("vai aumentar: " + poc);
        System.out.println("seu novo salario eh: " + (salario + poc));
        console.close();
    }

}