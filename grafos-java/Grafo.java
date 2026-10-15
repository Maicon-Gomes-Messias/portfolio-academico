import java.io.FileOutputStream;
import java.io.File;
import java.io.*; 
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.BufferedReader;
import java.util.Arrays;
import java.util.Scanner;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;
import java.util.*;
import java.io.*;


public class Grafo{
      private int linhas;
      private int colunas;
      private int matriz[][];
      private int visitado[]; //vertice visitado
      private int predecessor[];
  
    public Grafo(int linhas,int colunas)
    {
        this.linhas = linhas;
        this.colunas = colunas;
        this.matriz = new int[this.linhas+1][this.colunas+1];
        this.visitado = new int[this.linhas+1];
        this.predecessor = new int[this.linhas+1];
       this.gerarMatriz();
      
      
    }

      // Preenche a matriz
    public void gerarMatriz(){
        for ( int i = 0 ; i < this.linhas ; i++ ) {
            for ( int j = 0 ; j < this.colunas ; j++ ) {
                this.matriz[i][j] = 0;
            }
        }
    }



    public void printMatriz(){
        for ( int i = 1 ; i < this.linhas+1 ; i++ ) {
            for ( int j = 1 ; j < this.colunas+1 ; j++ ) {
                     System.out.printf("%d -", matriz[i][j]);
            }
           System.out.printf("%n");
        }
    }


 public void Insere_ligacao(int m,int n)//passa vertices e arestas
  {
    this.matriz[m][n] = 1; //preenche o dado
  }

  
 public  void verifica_sucessor(int vertice)
  {
    int cont = 0;

    for(int i = 1;i< colunas; i++)
      {
       
        if(matriz[vertice][i] == 1)
        {
       
          System.out.printf("Sucessores do vertice:%d ->vertice:%d \n",vertice,i);
             cont++;
        }

     
        
      }

      if(cont == 0)
        {
          System.out.printf("Não possui sucessores,grau 0");
        }
        else
      {
           System.out.printf("\nVertice sucessor - Grau Saida:%d -",cont);
      }
      
   
    
  }

  public  void verifica_antessesor(int vertice)
  {
    int cont = 0;
  
    
    for(int i=1;i<linhas;i++)
      {
          if(matriz[i][vertice] == 1)
          {
               System.out.printf("\nAntecessor do vertice:%d ->vertice:%d \n",vertice,i);
            cont++;
          }
       
        
      }

         if(cont == 0)
          {
               System.out.printf("\nNão possui Antecessores,grau 0\n");
            
          }
          else
         {
            System.out.printf("\nVertice Antessesor - Grau Entrada:%d -",cont);
         }

    
  }


  public void Inicializa_visitado(){
  for ( int i = 1 ; i < this.linhas+1 ; i++ ){
    this.visitado[i] = 0; //vertice visitado 
    }
  }
    
  public void Busca_Largura(int selecao){
    Inicializa_visitado(); //inicializa com 0
    this.visitado[selecao] = 1; //inicializa a posicao visitado com 1
    Queue<Integer> fila = new LinkedList<>(); //cria fila vasia
    fila.add(selecao);//enfilera o selecao
    try{
      while(fila.peek() != null){ //enquanto a fila n for vasia
        System.out.println("Fila :" + fila);  
        Integer u = fila.poll();
        System.out.println("Vértice atual: " + u); //Desenfilera a posicao
        for(int i=1;i<this.linhas+1;i++){//vai percorrer a matriz
          if(this.matriz[u][i] == 1){ // verifica conectividade 
            if(this.visitado[i] == 0){ //verifica se a posicao ainda n foi visitada 
              this.visitado[i] = 1;
              this.predecessor[i] = u; //saber o pai
              System.out.println("O vértice " + i + " foi visitado.\n");
              fila.add(i); //adiciona na fila pra rodar                
            }
          }
        }    
      }
    }
    catch (Exception EmptyStackException){
      System.out.println("Finalizado");      
    }
  }




  
  public void Busca_Profundidade(int selecao)  {
    Inicializa_visitado(); //inicializa com 0
    this.visitado[selecao] = 1; //inicializa a posicao visitado com 1        
    Stack<Integer> pilha = new Stack<Integer>();//cria pilha
    pilha.push(selecao);  //empilha o vetor
    try{


      
      
      while(pilha.empty() != true) {//enquanto a pilha n for vasia
        //System.out.println("Pilha :" + pilha);  
        int u = pilha.peek(); //converte pra inteiro      
        //System.out.println("Vértice atual: " + u);       
          for(int i = 1;i<this.linhas+1;i++){ //vai percorrer a matriz  
            if(this.matriz[u][i] == 1){
              if(this.visitado[i] == 0){ //verifica se a posicao ainda n foi visitada
                this.visitado[i] = 1;
                this.predecessor[i] = u; //saber o pai
                System.out.println("O vértice " + i + " foi visitado AGORA.\n");              
                pilha.push(i); //adiciona na pilha pra rodar
                u = i;
                System.out.println("Pilha: " + pilha);
              }  
              else{
                System.out.println("O vértice " + i + " foi ANTERIORMENTE.\n");
              }
            }
          }
          u =  pilha.pop();
          System.out.println("Pilha: " + pilha);
        }
      pilha.empty();
    }
    catch (Exception EmptyStackException) {
      System.out.println("Finalizado");      
    }
  }


  


  public void Verifica_Caminho(int vertice1, int vertice2)
  {      
    Inicializa_visitado(); //inicializa com 0
    Busca_Profundidade(vertice1);
    if(this.visitado[vertice1] == 1 && this.visitado[vertice2] == 1){
      System.out.println("Há Caminho");
    }
    else{
      System.out.println("Não há Caminho");
    }
  }

  public void Verifica_Conexo()
  { 
    boolean visitado_check = true;
    Busca_Profundidade(1);
    for(int i = 1;i<this.linhas+1;i++){
      if(this.visitado[i] == 0)
        visitado_check = false;  
    }
    if(visitado_check == false){
      System.out.println("O grafo não é conexo");
    }
    else{
      System.out.println("O grafo é conexo");
    }
  }

  public void Busca_Ciclo(int selecao)  {
    boolean existe_ciclo = false;
    Busca_Profundidade(selecao);
    for(int i = 1;i<this.linhas+1;i++){
      if (Math.abs(i - selecao) > 1){
        if(this.matriz[selecao][i] == 1)
          existe_ciclo = true;  
      }
    }
    if(existe_ciclo == true){
      System.out.println("O grafo possui ciclo");
    }
    else{
      System.out.println("O grafo não possui ciclo");
    }
  }


  public void Busca_Ciclo2(int selecao)  {
    Inicializa_visitado(); //inicializa com 0      
    this.visitado[selecao] = 0;
    Stack<Integer> pilha = new Stack<Integer>();//cria pilha
    pilha.push(selecao);  //empilha o vetor
    try{
      while(pilha.empty() != true) {//enquanto a pilha n for vasia
        System.out.println("Pilha :" + pilha);  
        int u = pilha.peek(); //converte pra inteiro      
        //System.out.println("Vértice atual: " + u);  
          for(int i = 1;i<this.linhas+1;i++){ //vai percorrer a matriz  
            if(this.matriz[u][i] == 1 && u < i){
              if(this.visitado[i] == 0){ //verifica se a posicao ainda n foi visitada
                this.visitado[i] = 1;
                this.predecessor[i] = u; //saber o pai
                System.out.println("Vértice u : " + u + " Valor i: " + i);
                System.out.println("O vértice " + i + " foi visitado AGORA.");              
                pilha.push(i); //adiciona na pilha pra rodar
                u = i;
                System.out.println("Pilha: " + pilha);
              }  
              // else{
              //    System.out.println("O vértice " + i + " foi ANTERIORMENTE.\n");
              // }
            }
          }
          u =  pilha.pop();
          System.out.println("Pilha: " + pilha);
        }
      if(this.visitado[selecao] == 1)
        System.out.println("O grafo possui ciclo.\n");
      else
        System.out.println("O grafo NÃO possui ciclo.\n");        
      pilha.empty();
    }
    catch (Exception EmptyStackException) {
      System.out.println("Finalizado");      
    }
  }



  
  public void chama_menu(){
    menu();
  }
  

  
  private void menu() { // menu principal
	int opcao = 0;
  int vertice;
	do {

     Scanner myInput = new Scanner( System.in );

		System.out.println("\n                  =========================");
		System.out.println("                  |     1 - Print Matriz       |");
		System.out.println("                  |     2 - Sucessor           |");
		System.out.println("                  |     3 - antecessor         |");
    System.out.println("                  |     4 - Busca Largura      |");
    System.out.println("                  |     5 - Busca Profundidade |");
    System.out.println("                  |     6 - Verificar Caminho  |");
    System.out.println("                  |     7 - Verificar Conexo   |");
    System.out.println("                  |     8 - Verificar Ciclo    |");
		System.out.println("                  |     0 - Sair               |");
		System.out.println("                  =========================\n");

		opcao = myInput.nextInt();
		System.out.print("\n");
		switch (opcao) {
		case 1:
        printMatriz();
			break;
		case 2:
      System.out.println("Digite um Vertice");
      vertice = myInput.nextInt();
			verifica_sucessor(vertice);
			break;
    case 3:
      System.out.println("Digite um Vertice");
      vertice = myInput.nextInt();
			verifica_antessesor(vertice);
			break;
    case 4:
      System.out.println("Digite um Vertice");
      vertice = myInput.nextInt();
      Busca_Largura(vertice);
			break;  
		case 5:
      System.out.println("Digite um Vertice");
      vertice = myInput.nextInt();
      Busca_Profundidade(vertice);
			break;
		case 6:
      System.out.println("Digite os vértices a serem verificados");
      int vertice1 = myInput.nextInt();
      int vertice2 = myInput.nextInt();
      Verifica_Caminho(vertice1,vertice2);
			break;
		case 7:
      System.out.println("Verifique se o grafo é conexo");
      Verifica_Conexo();
			break;
		case 8:
      System.out.println("Digite um Vértice para verificar se há ciclo");
      vertice = myInput.nextInt();
      Busca_Ciclo2(vertice);
			break;
		case 0:
			break;
		default:
			System.out.println("Opção Inválida!");
			break;
		}
	} while (opcao != 0);
}


  

  
}



    
  