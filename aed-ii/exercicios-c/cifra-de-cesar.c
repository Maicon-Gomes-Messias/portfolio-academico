#include <stdio.h>
#include <ctype.h>
#include <string.h>

int main()
{
    //declaracao de variaveis.
    char alfabeto[200],letra[200];
    int rot=3;
    int i=0;
    int aux=1;
    int N = strlen(alfabeto);//tamanho do vetor.

    //laco de repeticao while pra rodar inumeras vezes ate que a condicao de parada seja solicitada.
    while(aux==1)
    {   //scaneia os dados digitados pelo usuario
         scanf("\n%[^\n]s", &alfabeto);
         fflush(stdin);
         //condicao if de parada do while.
        if(alfabeto[0]=='F'&& alfabeto[1]=='I'&&alfabeto[2]=='M')
        {
            aux=0;
            break;
        }
        //laco de repeticao pra pecorrer o o elemento e a posicao do vetor.
        while(alfabeto[i] != '\0')
        {
            //condicao circular do alfabeto onde ao chegar no z+3,roda novamento o alfabeto.
            if(alfabeto[i]=='z')
            {
                alfabeto[i]='c';
            }
            else if (alfabeto[i]=='Z')
            {
                alfabeto[i]='C';
            }
             //condicao circular do alfabeto onde ao chegar no Y+3,roda novamento o alfabeto.
            else if (alfabeto[i]=='y')
            {
                alfabeto[i]='b';
            }
            else if (alfabeto[i]=='Y')
            {
                alfabeto[i]='B';
            }
             //condicao circular do alfabeto onde ao chegar no w+3,roda novamento o alfabeto.
            else if (alfabeto[i]=='w')
            {
                alfabeto[i]='a';
            }
            else if (alfabeto[i]=='W')
            {
                alfabeto[i]='A';
            }
             //condicao onde verifiva se no vetor existe espaciamento se houver soma a posicao com +1
             //condicao onde verifica o elemento do vetor e soma com + 3 pra criptografar a mensagem.
            else if(alfabeto[i]!=' '&& alfabeto[i]!='\r')
            {
                alfabeto[i] = (int )alfabeto[i]+rot;
            }
            i++;
        }
        //imprime na tela
        printf("%s",alfabeto);
    }




    return 0;
}
