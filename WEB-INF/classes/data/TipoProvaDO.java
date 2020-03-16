package data;

public class TipoProvaDO {
  private int _id;
  private String _nome_da_prova;
  private String _distancia;
  private String _categoria;
  private String _categoria2;
  private int _quantidade_de_participantes;

  public int getId() {
     return _id;
  } // getId

  public void setId(int id) {
    _id = id;
  } // setId

  public String getNome_Da_Prova() {
    return _nome_da_prova;
  } // obterNome_Da_Prova

  public void setNome_Da_Prova(String nome_da_prova) {
    _nome_da_prova = nome_da_prova;
  } // setNome_Da_Prova

  public String getDistancia() {
    return _distancia;
  } // getDistancia

  public void setDistancia(String distancia) {
    _distancia = distancia;
  } // setDistancia

  public String getCategoria() {
    return _categoria;
  } // getCategoria

  public void setCategoria(String cat) {
    _categoria = cat;
  } // setCategoria

  public String getCategoria2() {
    return _categoria2;
  } // getCategoria2

  public void setCategoria2(String cat2) {
    _categoria = cat2;
  } // setCategoria2

  public int getQuantidade_De_Participantes() {
     return _quantidade_de_participantes;
  } // getQuantidade_De_Participantes

  public void setQuantidade_De_Participantes(int quant) {
    _quantidade_de_participantes = quant;
  } // setQuantidade_De_Participantes

} // TipoProvaDO
