package data;

public class AtletaDO {
  private int _id_ATLETA;
  private int _id_CLUBE;
  private int _id_TECNICO;
  private String _nome_ATLETA;
  private String _sobrenome_ATLETA;
  private String _rg_ATLETA;
  private String _cpf_ATLETA;
  private String _data_nascimento_ATLETA;
  private int _mensalidade_ATLETA;

  public int getID_ATLETA() {
     return _id_ATLETA;
  } // getId_ATLETA

  public void setID_ATLETA(int id) {
    _id_ATLETA = id;
  } // setId_ATLETA
  
  public int getID_CLUBE() {
     return _id_CLUBE;
  } // getId_CLUBE

  public void setID_CLUBE(int id) {
    _id_CLUBE = id;
  } // setId_CLUBE
  
  public int getID_TECNICO() {
     return _id_TECNICO;
  } // getId_TECNICO

  public void setID_TECNICO(int id) {
    _id_TECNICO = id;
  } // setId_TECNICO

  public String getNOME_ATLETA() {
    return _nome_ATLETA;
  } // obterNome_ATLETA

  public void setNOME_ATLETA(String nome) {
    _nome_ATLETA = nome;
  } // setNome_ATLETA
  
  public String getSOBRENOME_ATLETA() {
    return _sobrenome_ATLETA;
  } // obterSobrenome_ATLETA

  public void setSOBRENOME_ATLETA(String sobrenome) {
    _sobrenome_ATLETA = sobrenome;
  } // setSobrenome_ATLETA
  
  public String getRg_ATLETA() {
    return _rg_ATLETA;
  } // obterRg_ATLETA

  public void setRg_ATLETA(String rg) {
    _rg_ATLETA = rg;
  } // setRg_ATLETA
  
  public String getCpf_ATLETA() {
    return _cpf_ATLETA;
  } // obterCpf_ATLETA

  public void setCpf_ATLETA(String cpf) {
    _cpf_ATLETA = cpf;
  } // setCpf_ATLETA
  
  public String getData_nascimento_ATLETA() {
    return _data_nascimento_ATLETA;
  } // obterData_nascimento_ATLETA

  public void setData_nascimento_ATLETA(String data_nascimento) {
    _data_nascimento_ATLETA = data_nascimento;
  } // setData_nascimento_ATLETA
  
  public int getMensalidade_ATLETA() {
    return _mensalidade_ATLETA;
  } // obterData_nascimento_ATLETA

  public void setMensalidade_ATLETA(int mensalidade_atleta) {
    _mensalidade_ATLETA = mensalidade_atleta;
  } // setData_nascimento_ATLETA
  
} // AtletaDO