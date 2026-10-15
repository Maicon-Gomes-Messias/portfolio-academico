


#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
// FUNCAO PARA ACESSAR O TAMANHO DO VETOR
int tamanho_vet(char *str)
{
    int total = 0;

    while (str[total] != '\0')
        total++;

    return total;
}
//FUNCAO BOOL QUE RETORNA FALSE OU TRUE SOBRE CASO A PALAVRA SEJA PALINDROMO OU NAO
bool palindromo(char *palavra)
{
    //DECLARACAO DO VETOR INVERSO E A VARIAVEIS
    int x,f = 0;
    char inverso[200];
    // "X" ASSUME O VALOR RECEBIDO DO TAMANHO DO VETOR.
    x = tamanho_vet(palavra);
    //LACO DE REPETICAO PRA REALIZAR A INVERSAO DAS PALAVRAS.
    for (int i = x - 1; i >= 0; i--)
    {   //"TOLEWER" TRANSFORMA AS LETRAS MAIUCULAS EM MINUSCULA.
        palavra[f] = tolower(palavra[f]);
        inverso[f] = palavra[i];
        f++;
    }   //"\0"DESCONSIDERA O RESTO DAS VARIVEIS QUE ESTA
    inverso[f] = '\0';
    f = 0;

    for (int j = 0; j < x; j++)
    {
        if (inverso[j] == ' '||inverso[j]=='\r')
        {
            j++;
        }
        if (palavra[f] == ' ')
        {
            f++;
        }
        if (inverso[j] != palavra[f] || inverso[j]=='\r' )
        {

            return false;
        }
        else
        {
            f++;
        }

    }
    return true;


}
int main()
{
    int confirmacao=1;
    while(confirmacao)
    {
        char palavra[200];
        scanf("\n%[^\n]s", &palavra);
        if(palavra[0]== 'F' && palavra[1]== 'I' && palavra[2]== 'M')
        {
            confirmacao=0;
        }
        else if(palindromo(palavra))
        {
            printf("SIM\n");
        }
        else
        {
            printf("NAO\n");
        }
    }
    return 0;
}
