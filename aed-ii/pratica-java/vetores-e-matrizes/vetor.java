import java.util.Scanner;

public class vetor {
    public static void main(String[] args) throws Exception {

        Scanner console = new Scanner(System.in);
        // declaracao de variaveis
        String gabarito[] = new String[8];
        String resposta;
        int nota = 0;
        double porcentagem = 0;

        System.out.println("------Gabarito--------");
        System.out.println("--Favor cadastrar as resposta questoes da prova--");
        // cadastramento do gabarito.
        for (int i = 0; i < 8; i++) {
            System.out.print((i + 1) + " Questao:");
            gabarito[i] = console.nextLine();
        }
        // cadastramento dos alunos
        for (int i = 0; i < 10; i++) {

            System.out.println("-------- aluno " + (i + 1) + " --------");
            // entrada de dados da resposta do aluno
            for (int j = 0; j < 8; j++) {
                System.out.println("digite a resposta da " + (j + 1) + " questão");
                resposta = console.next();
                // condiçao pra comparar o gabarito com a resposta e informar a nota e
                // porcentagem
                if (resposta.equals(gabarito[j])) {
                    nota++;
                    porcentagem = (nota * 100) / 8;
                }
                // cadeia de if else para verificar se o aluno foi aprovado ou nao
            }
            if (porcentagem >= 62) {
                System.out.println("Status: Aprovado");
            } else {
                System.out.println("Status: Reprovado");
            }
            // saida de dados onde printa para o usuario a nota a nota do aluno e a
            // porcentagem.
            System.out.println("A nota do aluno " + (i + 1) + " é : " + nota);
            System.out.println("A porcentagem de aprovação do aluno " + (i + 1) + " é : " + porcentagem + " porcento");

            nota = 0;
        }
        console.close();
    }
}
