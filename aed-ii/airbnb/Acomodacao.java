import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Scanner;
import java.lang.String;

import javax.swing.JOptionPane;

class Acomodacao {

    private int roomid;
    private int hostid;
    private String roomtype;
    private String country;
    private String city;
    private String neighbourhood;
    private int reviews;
    private double overallsatisfaction;
    private int accommodates;
    private double bedrooms;
    private double price;
    private String propetytype;

    // construtor acomodação
    public Acomodacao(int roomid, int hostid, String roomtype, String country, String city, String neighbourhood,
            int reviews, double overallsatisfaction, int accommodates, double bedrooms, double price,
            String propetytype) {

        this.roomid = roomid;
        this.hostid = hostid;
        this.roomtype = roomtype;
        this.country = country;
        this.city = city;
        this.neighbourhood = neighbourhood;
        this.reviews = reviews;
        this.overallsatisfaction = overallsatisfaction;
        this.accommodates = accommodates;
        this.bedrooms = bedrooms;
        this.price = price;
        this.propetytype = propetytype;
    }

    public Acomodacao(String[] dados) {
        this.roomid = Integer.parseInt(dados[0]);
        this.hostid = Integer.parseInt(dados[1]);
        this.roomtype = dados[2];
        this.country = dados[3];
        this.city = dados[4];
        this.neighbourhood = dados[5];
        this.reviews = Integer.parseInt(dados[6]);
        this.overallsatisfaction = Double.parseDouble(dados[7]);
        this.accommodates = Integer.parseInt(dados[8]);
        this.bedrooms = Double.parseDouble(dados[9]);
        this.price = Double.parseDouble(dados[10]);
        this.propetytype = dados[11];
    }

    public int getRoomid() {
        return roomid;
    }

    public String getPropetytype() {
        return propetytype;
    }

    public void setPropetytype(String propetytype) {
        this.propetytype = propetytype;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getBedrooms() {
        return bedrooms;
    }

    public void setBedrooms(double bedrooms) {
        this.bedrooms = bedrooms;
    }

    public int getAccommodates() {
        return accommodates;
    }

    public void setAccommodates(int accommodates) {
        this.accommodates = accommodates;
    }

    public double getOverallsatisfaction() {
        return overallsatisfaction;
    }

    public void setOverallsatisfaction(double overallsatisfaction) {
        this.overallsatisfaction = overallsatisfaction;
    }

    public int getReviews() {
        return reviews;
    }

    public void setReviews(int reviews) {
        this.reviews = reviews;
    }

    public String getNeighbourhood() {
        return neighbourhood;
    }

    public void setNeighbourhood(String neighbourhood) {
        this.neighbourhood = neighbourhood;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getRoomtype() {
        return roomtype;
    }

    public void setRoomtype(String roomtype) {
        this.roomtype = roomtype;
    }

    public int getHostid() {
        return hostid;
    }

    public void setHostid(int hostid) {
        this.hostid = hostid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public void clonar() {

    }

    public void ler() {

        Path caminho = Paths.get("/arquivo.txt");
        try {
            byte[] texto = Files.readAllBytes(caminho);
            String Leitura = new String(texto);
            JOptionPane.showMessageDialog(null, Leitura);
        } catch (Exception erro) {

        }

    }

    public void imprimir() {
        System.out.println("[" + this.roomid + " ## " + this.hostid + " ## " + this.roomtype + " ## " + this.country
                + " ## " + this.city + " ## " + this.neighbourhood + " ## " + this.reviews + " ## "
                + this.overallsatisfaction + " ## " + this.accommodates + " ## " + this.bedrooms + " ## " + this.price
                + " ## " + this.propetytype + "]");
    }

    static int comparacao = 0;
    static int movimentacao = 0;

    public static ArrayList<Acomodacao> bubbleSort(ArrayList<Acomodacao> vetor) {
        ArrayList<Acomodacao> vetorOrdenado = vetor;

        for (int i = 0; i < vetorOrdenado.size() - 1; i++) {
            for (int j = 0; j < vetorOrdenado.size() - 1 - i; j++) {
                if (vetorOrdenado.get(j).getReviews() > vetorOrdenado.get(j + 1).getReviews()) {
                    Acomodacao aux = vetorOrdenado.get(j);
                    vetorOrdenado.set(j, vetorOrdenado.get(j + 1));
                    vetorOrdenado.set(j + 1, aux);
                } else if (vetorOrdenado.get(j).getReviews() == vetorOrdenado.get(j + 1).getReviews()) {
                    if (vetorOrdenado.get(j).getRoomid() > vetorOrdenado.get(j + 1).getRoomid()) {
                        comparacao++;
                        movimentacao++;
                        Acomodacao aux = vetorOrdenado.get(j);
                        vetorOrdenado.set(j, vetorOrdenado.get(j + 1));
                        vetorOrdenado.set(j + 1, aux);
                    }
                }
            }

        }
        return vetorOrdenado;
    }

    public static ArrayList<Acomodacao> insercao(ArrayList<Acomodacao> vetor) {
        ArrayList<Acomodacao> vetorOrdenado = vetor;

        for (int i = 1; i < vetorOrdenado.size(); i++) {
            int value = vetorOrdenado.get(i).getAccommodates();
            int j = i;

            while (j > 0 && vetorOrdenado.get(j - 1).getAccommodates() > value) {

                vetorOrdenado.get(j).accommodates = vetorOrdenado.get(j - 1).getAccommodates();
                j -= 1;
                comparacao++;

            }
            vetorOrdenado.get(j).accommodates = value;
            movimentacao++;
        }

        return vetorOrdenado;

    }

    public static ArrayList<Acomodacao> selecao(ArrayList<Acomodacao> vetor) {
        ArrayList<Acomodacao> vetorOrdenado = vetor;

        for (int i = 0; i < vetorOrdenado.size() - 1; i++) {
            int indiceMinimo = i;
            for (int j = i + 1; j < vetorOrdenado.size(); j++) {
                if (vetorOrdenado.get(j).getCountry().compareTo(vetorOrdenado.get(indiceMinimo).getCountry()) < 0) {
                    indiceMinimo = j;
                    comparacao++;
                } else if (vetorOrdenado.get(j).getCountry().equals(vetorOrdenado.get(indiceMinimo).getCountry())) {
                    if (vetorOrdenado.get(j).getCity().compareTo(vetorOrdenado.get(indiceMinimo).getCity()) < 0) {
                        indiceMinimo = j;
                        comparacao++;

                    } else if (vetorOrdenado.get(j).getCity().equals(vetorOrdenado.get(indiceMinimo).getCity())) {
                        if (vetorOrdenado.get(j).getNeighbourhood()
                                .compareTo(vetorOrdenado.get(indiceMinimo).getNeighbourhood()) < 0) {
                            indiceMinimo = j;
                            comparacao++;

                        } else if (vetorOrdenado.get(j).getCity().equals(vetorOrdenado.get(indiceMinimo).getCity())) {
                            if (vetorOrdenado.get(j).getRoomid() < vetorOrdenado.get(indiceMinimo).getRoomid()) {
                                indiceMinimo = j;
                                comparacao++;
                            }

                        }
                    }

                }
            }
            Acomodacao aux = vetorOrdenado.get(indiceMinimo);
            vetorOrdenado.set(indiceMinimo, vetorOrdenado.get(i));
            vetorOrdenado.set(i, aux);
            movimentacao++;

        }
        return vetorOrdenado;
    }

    public static ArrayList<Acomodacao> heapsort(ArrayList<Acomodacao> vetor) {
        ArrayList<Acomodacao> vetorOrdenado = vetor;
        int tamanho = vetorOrdenado.size();
        int i = tamanho / 2, pai, filho, t;
        while (true) {
            if (i > 0) {
                i--;
                t = vetorOrdenado.get(i).getReviews();
            } else {
                tamanho--;
                if (tamanho <= 0) {
                    return vetorOrdenado;
                }
                t = vetorOrdenado.get(tamanho).getReviews();
                vetorOrdenado.get(tamanho).reviews = vetorOrdenado.get(0).getReviews();
            }
            pai = i;
            filho = ((i * 2) + 1);
            while (filho < tamanho) {
                if ((filho + 1 < tamanho)
                        && (vetorOrdenado.get(filho + 1).getReviews() > vetorOrdenado.get(filho).getReviews())) {
                    filho++;
                }
                if (vetorOrdenado.get(filho).getReviews() > t) {
                    vetorOrdenado.get(pai).reviews = vetorOrdenado.get(filho).getReviews();
                    pai = filho;
                    filho = pai * 2 + 1;
                } 
            }
            vetorOrdenado.get(pai).reviews = t;
        }
    }
    private static void merge(ArrayList<Acomodacao> esquerda, ArrayList<Acomodacao> direita, ArrayList<Acomodacao> vetorOrdenado) {
        int i = 0, j = 0, k = 0;
        while (i < esquerda.size() && j < direita.size()) {
            if (esquerda.get(i).getHostid()<= direita.get(j).getHostid()) {
                vetorOrdenado.set(k, esquerda.get(i));
                i++;
            } else {
                vetorOrdenado.set(k, direita.get(j));
                j++;
            }
            k++;
            movimentacao++;
        } if(vetorOrdenado.get(i).getHostid()==vetorOrdenado.get(i).getHostid()){
            while (i < esquerda.size() && j < direita.size()) {
                if (esquerda.get(i).getRoomid()<= direita.get(j).getRoomid()) {
                    vetorOrdenado.set(k, esquerda.get(i));
                    i++;
                } else {
                    vetorOrdenado.set(k, direita.get(j));
                    j++;
                }
                k++;
                movimentacao++;
            }
        }
        while (i < esquerda.size()) {
            vetorOrdenado.set(k, esquerda.get(i));
            i++;
            k++;
            movimentacao++;
        }
        while (j < direita.size()) {
            vetorOrdenado.set(k, direita.get(j));
            j++;
            k++;
            movimentacao++;
        }
    }

    public static ArrayList<Acomodacao> mergeSort(ArrayList<Acomodacao> vetor) {
        ArrayList<Acomodacao> vetorOrdenado = vetor;
        if (vetor.size() > 1) {
            int meio = vetor.size() / 2;
            ArrayList<Acomodacao> esquerda = new ArrayList<>();
            ArrayList<Acomodacao> direita = new ArrayList<>();

            for (int i = 0; i < meio; i++) {
                esquerda.add(vetorOrdenado.get(i));
            }
            for (int i = meio; i < vetorOrdenado.size(); i++) {
                direita.add(vetorOrdenado.get(i));
            }
            mergeSort(esquerda);
            mergeSort(direita);
            merge(esquerda, direita, vetorOrdenado);
        }
        return vetorOrdenado;
    }

    public static ArrayList<Acomodacao> quickSort(ArrayList<Acomodacao> vetor) {
        ArrayList<Acomodacao> vetorOrdenado = vetor;
        quickSort(vetorOrdenado, 0, vetorOrdenado.size() - 1);
        return vetorOrdenado;
    }

    private static void quickSort(ArrayList<Acomodacao> vetorOrdenado, int inicio, int fim) {
        int i = inicio;
        int j = fim;
        double pivo = vetorOrdenado.get((inicio + fim) / 2).getPrice();
        while (i <= j) {
            while (vetorOrdenado.get(i).getPrice() < pivo) {
                i++;
                comparacao++;
            }
            while (vetorOrdenado.get(j).getPrice() > pivo) {
                j--;
                comparacao++;
            }
            if (i <= j) {
                Acomodacao aux = vetorOrdenado.get(i);
                vetorOrdenado.set(i, vetorOrdenado.get(j));
                vetorOrdenado.set(j, aux);
                i++;
                j--;
                movimentacao++;
            }
        
        }
        if (inicio < j) {
            quickSort(vetorOrdenado, inicio, j);
        }
        if (i < fim) {
            quickSort(vetorOrdenado, i, fim);
        }
        

    }

    public static void main(String[] args) throws Exception {

        // usado para proposito de teste com entrada
        // FileReader ler2 = new FileReader("pub.in");
        // BufferedReader console = new BufferedReader(ler2);

        Scanner console = new Scanner(System.in);

        FileReader ler = new FileReader("dados_airbnb.txt");
        BufferedReader reader = new BufferedReader(ler);

        ArrayList<Acomodacao> hoteis = new ArrayList<Acomodacao>();

        // armazenando do usuario a lista de roomids
        int quantidade = Integer.parseInt(console.nextLine());
        int[] vetorAcomodacoes = new int[quantidade];
        for (int i = 0; i < quantidade; i++) {
            int roomId = Integer.parseInt(console.nextLine());
            vetorAcomodacoes[i] = roomId;
        }

        // recebendo e armazenando acomodações recebidas do arquivo de entrada
        String primeiraLinha = reader.readLine(); // não será utilizada
        String linha;
        String[] dados;
        while ((linha = reader.readLine()) != null) {
            dados = linha.split("\t");

            for (int i = 0; i < quantidade; i++) {
                if (Integer.parseInt(dados[0]) == vetorAcomodacoes[i]) {
                    hoteis.add(new Acomodacao(dados));
                    break;
                }
            }
            // hoteis.get(hoteis.size() - 1).imprimir();
        }

        long tempo_inicio = System.currentTimeMillis();
        // ordena vetor de acomodações
         ArrayList<Acomodacao> hoteisOrdenados = bubbleSort(hoteis);
        // ArrayList<Acomodacao> hoteisOrdenados = insercao(hoteis);
        //  ArrayList<Acomodacao> hoteisOrdenados = selecao(hoteis);
        //ArrayList<Acomodacao> hoteisOrdenados = heapsort(hoteis);
        //  ArrayList<Acomodacao> hoteisOrdenados = quickSort(hoteis);
        //  ArrayList<Acomodacao> hoteisOrdenados = mergeSort(hoteis);

        long tempo_fim = System.currentTimeMillis();
        long duracao_bubble = tempo_fim - tempo_inicio;

        try {
            FileWriter file = new FileWriter("/tmp/matrícula_bolha.txt");
            file.write("695785\t" + duracao_bubble + "\t" + comparacao + "\t" + movimentacao);
            file.close();
        } catch (IOException e) {
            System.out.println("Ocorreu um erro: " + e.getMessage());
        }
        try {
            FileWriter file = new FileWriter("/tmp/matrícula_insercao.txt");
            file.write("695785\t" + duracao_bubble + "\t" + comparacao + "\t" + movimentacao);
            file.close();
        } catch (IOException e) {
            System.out.println("Ocorreu um erro: " + e.getMessage());
        }
        try {
            FileWriter file = new FileWriter("/tmp/matrícula_selecao.txt");
            file.write("695785\t" + duracao_bubble + "\t" + comparacao + "\t" + movimentacao);
            file.close();
        } catch (IOException e) {
            System.out.println("Ocorreu um erro: " + e.getMessage());
        }
        try {
            FileWriter file = new FileWriter("/tmp/matrícula_heapsort.txt");
            file.write("695785\t" + duracao_bubble + "\t" + comparacao + "\t" + movimentacao);
            file.close();
        } catch (IOException e) {
            System.out.println("Ocorreu um erro: " + e.getMessage());
        }
        try {
            FileWriter file = new FileWriter("/tmp/matrícula_quicksort.txt");
            file.write("695785\t" + duracao_bubble + "\t" + comparacao + "\t" + movimentacao);
            file.close();
        } catch (IOException e) {
            System.out.println("Ocorreu um erro: " + e.getMessage());
        }
        try {
            FileWriter file = new FileWriter("/tmp/matrícula_mergesort.txt");
            file.write("695785\t" + duracao_bubble + "\t" + comparacao + "\t" + movimentacao);
            file.close();
        } catch (IOException e) {
            System.out.println("Ocorreu um erro: " + e.getMessage());
        }

        // imprime hoteis ordenados
        // for (int j = 0; j < hoteisOrdenados.size(); j++) {
        // hoteisOrdenados.get(j).imprimir();
        // }
        for (int j = 0; j < hoteisOrdenados.size(); j++) {
            hoteisOrdenados.get(j).imprimir();
        }
        console.close();

    }
}