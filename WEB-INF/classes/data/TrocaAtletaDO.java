package data;

public class TrocaAtletaDO {
  private int _id_atleta;
  private int _id_clube_antigo;
  private int _id_clube_novo;
  private boolean _aprovado_clube_antigo;

  public int getIdAtleta() {
     return _id_atleta;
  } // getIdAtleta

  public void setIdAtleta(int id) {
    _id_atleta = id;
  } // setIdAtleta

  public int getIdClubeAntigo() {
    return _id_clube_antigo;
  } // getIdClubeAntigo

  public void setIdClubeAntigo(int id_clube) {
    _id_clube_antigo = id_clube;
  } // setIdClubeAntigo


  public int getIdClubeNovo() {
    return _id_clube_novo;
  } // getIdClubeNovo

  public void setIdClubeNovo(int id_clube) {
    _id_clube_novo = id_clube;
  } // setIdClubeNovo

 public boolean getAprovadoClubeAntigo() {
    return _aprovado_clube_antigo;
  } // getIdClubeNovo

  public void setAprovadoClubeAntigo(boolean aprovado_clube) {
    _aprovado_clube_antigo = aprovado_clube;
  } // setIdClubeNovo
} // ContatoDO